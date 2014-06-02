using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Homesite.Contracts.Data.Entities;

namespace Homesite.Contracts.Data.Repository
{
    public interface ISoftwareLifecycleRepository
    {
        void Save(ISoftwareLifecycle entity);
        void SaveAll(IList<ISoftwareLifecycle> entities);
        void Delete(ISoftwareLifecycle entity);
        void DeleteAll(IList<ISoftwareLifecycle> entities);
        IList<ISoftwareLifecycle> GetActive();
        IList<ISoftwareLifecycle> GetAll();
    }
}
