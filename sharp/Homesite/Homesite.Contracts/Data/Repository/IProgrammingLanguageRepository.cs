using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Homesite.Contracts.Data.Entities;

namespace Homesite.Contracts.Data.Repository
{
    public interface IProgrammingLanguageRepository
    {
        void Save(IProgrammingLanguage entity);
        void SaveAll(IList<IProgrammingLanguage> entities);
        void Delete(IProgrammingLanguage entity);
        void DeleteAll(IList<IProgrammingLanguage> entities);
        IList<IProgrammingLanguage> GetActive();
        IList<IProgrammingLanguage> GetAll();
    }
}
