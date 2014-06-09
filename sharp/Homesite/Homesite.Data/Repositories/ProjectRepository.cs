using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Repository;
using Homesite.Contracts.Data.Entities;


namespace Homesite.Data.Repositories
{
    public class ProjectRepository: BaseRepository, IProjectRepository
    {

        public void Save(IProject entity)
        {
            base.Save<IProject>(entity);
        }

        public void SaveAll(IList<IProject> entities)
        {
            base.SaveAll<IProject>(entities);
        }

        public void Delete(IProject entity)
        {
            base.Delete<IProject>(entity);
        }

        public void DeleteAll(IList<IProject> entities)
        {
            base.DeleteAll<IProject>(entities);
        }

        public IList<IProject> GetActive()
        {
            return base.GetActive<IProject>();
        }

        public IList<IProject> GetAll()
        {
            return base.GetAll<IProject>();
        }
    }
}
