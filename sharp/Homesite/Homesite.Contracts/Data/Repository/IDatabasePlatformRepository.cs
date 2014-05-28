using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Homesite.Contracts.Data.Entities;


namespace Homesite.Contracts.Data.Repository
{
    public interface IDatabasePlatformRepository
    {
        void Save(IDatabasePlatform entity);
        void SaveAll(IList<IDatabasePlatform> entities);
        void Delete(IDatabasePlatform entity);
        IList<IDatabasePlatform> GetActive();
        IList<IDatabasePlatform> GetAll();
    }
}
