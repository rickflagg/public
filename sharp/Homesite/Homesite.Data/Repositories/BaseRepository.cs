using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

using NHibernate;
using NHibernate.Criterion;
using NHibernate.Linq;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;

using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;

using Homesite.Contracts.Data.Entities;

namespace Homesite.Data.Repositories
{
    public class BaseRepository
    {

        protected IList<T> GetAll<T>()   
        {
            IList<T> retval = new List<T>();

            using(ISession session = this.GetSession())
            {
                retval = session.Query<T>().ToList<T>();
            }

            return retval;
        }

        protected IList<T> GetActive<T>() where T : IBaseEntitiy
        {
            IList<T> retval = new List<T>();

            using (ISession session = this.GetSession())
            {
                retval = (
                    from x in session.Query<T>()
                    where (x.Active.Equals(true))
                    select x).ToList<T>();
            }

            return retval;
        }

        protected void Save<T>(T entity)
        {
            using (ISession session = this.GetSession())
            {
                using (ITransaction trans = session.BeginTransaction())
                {
                    session.SaveOrUpdate(entity);
                    trans.Commit();
                    session.Flush();
                }
            }
        }

        protected void SaveAll<T>(IList<T> entities)
        {
            if (entities != null && entities.Count > 0)
            {
                foreach (T entity in entities)
                {
                    this.Save<T>(entity);
                }
            }
        }

        protected void Delete<T>(T entity)
        {
            using (ISession session = this.GetSession())
            {
                using (ITransaction trans = session.BeginTransaction())
                {
                    session.Delete(entity);
                    trans.Commit();
                    session.Flush();
                }
            }
        }

        protected void DeleteAll<T>(IList<T> entities)
        {
            if (entities != null && entities.Count > 0)
            {
                foreach (T entity in entities)
                {
                    this.Delete<T>(entity);
                }
            }
        }

        protected ISession GetSession()
        {
            return Fluently.Configure()
              .Database(
                PostgreSQLConfiguration.Standard
                 .ConnectionString(this.ActiveConnectionString)
              )
              .Mappings(m =>
                m.FluentMappings.AddFromAssemblyOf<BaseRepository>())
              .ExposeConfiguration(UpdateSchema)
              .BuildSessionFactory()
              .OpenSession();
        }

        private void UpdateSchema(NHibernate.Cfg.Configuration config)
        {
            // this NHibernate tool takes a configuration (with mapping info in)
            // and exports a database schema from it
            new SchemaUpdate(config)
              .Execute(false, true);
        }

        private string ActiveConnectionString
        {
            get
            {
                String retval = null;

                String activeConnectionStringIndicator = ConfigurationManager.AppSettings["active.connection"];

                if (!String.IsNullOrEmpty(activeConnectionStringIndicator))
                {
                    retval = ConfigurationManager.ConnectionStrings[activeConnectionStringIndicator].ToString();
                }

                return retval;
            }
        }

    }
}
