using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Homesite.Contracts.Data.Entities;


namespace Homesite.Contracts.Data.Repository
{
    public interface IRoleRepository
    {
        void Save(IRole entity);
        void SaveAll(IList<IRole> entities);
        void Delete(IRole entity);
        void DeleteAll(IList<IRole> entities);
        IList<IRole> GetActive();
        IList<IRole> GetAll();
    }
}
