using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Homesite.Contracts.Data.Entities;


namespace Homesite.Contracts.Data.Repository
{
    public interface IProgrammingToolkitRepository
    {
        void Save(IProgrammingToolkit entity);
        void SaveAll(IList<IProgrammingToolkit> entities);
        void Delete(IProgrammingToolkit entity);
        IList<IProgrammingToolkit> GetActive();
        IList<IProgrammingToolkit> GetAll();
    }
}
