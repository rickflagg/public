using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Repository;
using Homesite.Contracts.Data.Entities;


namespace Homesite.Data.Repositories
{
    public class ClientRepository: BaseRepository, IClientRepository
    {
        public void Save(IClient entity)
        {
            base.Save<IClient>(entity);
        }

        public void SaveAll(IList<IClient> entities)
        {
            base.SaveAll<IClient>(entities);
        }

        public void Delete(IClient entity)
        {
            base.Delete<IClient>(entity);
        }

        public void DeleteAll(IList<IClient> entities)
        {
            base.DeleteAll<IClient>(entities);
        }

        public IList<IClient> GetActive()
        {
            return base.GetActive<IClient>();
        }

        public IList<IClient> GetAll()
        {
            return base.GetAll<IClient>();
        }
    }
}
