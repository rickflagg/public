using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Homesite.Contracts.Data.Entities;


namespace Homesite.Contracts.Data.Repository
{
    public interface IClientRepository
    {
        void Save(IClient entity);
        void SaveAll(IList<IClient> entities);
        void Delete(IClient entity);
        void DeleteAll(IList<IClient> entities);
        IList<IClient> GetActive();
        IList<IClient> GetAll();
    }
}
