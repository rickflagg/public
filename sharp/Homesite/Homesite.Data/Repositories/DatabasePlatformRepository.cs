using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Repository;
using Homesite.Contracts.Data.Entities;

namespace Homesite.Data.Repositories
{
    public class DatabasePlatformRepository: BaseRepository, IDatabasePlatformRepository
    {
        public void Save(IDatabasePlatform entity)
        {
            base.Save<IDatabasePlatform>(entity);
        }

        public void SaveAll(IList<IDatabasePlatform> entities)
        {
            base.SaveAll<IDatabasePlatform>(entities);
        }

        public void Delete(IDatabasePlatform entity)
        {
            base.Delete<IDatabasePlatform>(entity);
        }

        public IList<IDatabasePlatform> GetActive()
        {
            return base.GetActive<IDatabasePlatform>();
        }

        public IList<IDatabasePlatform> GetAll()
        {
            return base.GetAll<IDatabasePlatform>();
        }


        public void DeleteAll(IList<IDatabasePlatform> entities)
        {
            base.DeleteAll<IDatabasePlatform>(entities);
        }
    }
}
