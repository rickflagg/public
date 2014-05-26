using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Homesite.Contracts.Data.Entities;

namespace Homesite.Contracts.Data.Repository
{
    public interface IDesignPatternRepository
    {
        void Save(IDesignPattern entity);
        void SaveAll(IList<IDesignPattern> entities);
        void Delete(IDesignPattern entity);
        IList<IDesignPattern> GetActive();
        IList<IDesignPattern> GetAll();
    }
}
