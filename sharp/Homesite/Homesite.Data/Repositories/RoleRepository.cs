using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Repository;
using Homesite.Contracts.Data.Entities;


namespace Homesite.Data.Repositories
{
    public class RoleRepository: BaseRepository, IRoleRepository
    {
        public void Save(IRole entity)
        {
            base.Save<IRole>(entity);
        }

        public void SaveAll(IList<IRole> entities)
        {
            base.SaveAll<IRole>(entities);
        }

        public void Delete(IRole entity)
        {
            base.Delete<IRole>(entity);
        }

        public void DeleteAll(IList<IRole> entities)
        {
            base.DeleteAll<IRole>(entities);
        }

        public IList<IRole> GetActive()
        {
            return base.GetActive<IRole>();
        }

        public IList<IRole> GetAll()
        {
            return base.GetAll<IRole>();
        }
    }
}
