using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Repository;
using Homesite.Contracts.Data.Entities;


namespace Homesite.Data.Repositories
{
    public class SoftwareLifecycleRepository : BaseRepository, ISoftwareLifecycleRepository
    {
        public void Save(ISoftwareLifecycle entity)
        {
            base.Save<ISoftwareLifecycle>(entity);
        }

        public void SaveAll(IList<ISoftwareLifecycle> entities)
        {
            base.SaveAll<ISoftwareLifecycle>(entities);
        }

        public void Delete(ISoftwareLifecycle entity)
        {
            base.Delete<ISoftwareLifecycle>(entity);
        }

        public IList<ISoftwareLifecycle> GetActive()
        {
            return base.GetActive<ISoftwareLifecycle>();
        }

        public IList<ISoftwareLifecycle> GetAll()
        {
            return base.GetAll<ISoftwareLifecycle>();
        }


        public void DeleteAll(IList<ISoftwareLifecycle> entities)
        {
            base.DeleteAll<ISoftwareLifecycle>(entities);
        }
    }
}
