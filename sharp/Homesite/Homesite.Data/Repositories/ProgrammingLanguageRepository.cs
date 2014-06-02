using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Entities;
using Homesite.Contracts.Data.Repository;

namespace Homesite.Data.Repositories
{
    public class ProgrammingLanguageRepository: BaseRepository, IProgrammingLanguageRepository
    {

        public void Save(IProgrammingLanguage entity)
        {
            base.Save<IProgrammingLanguage>(entity);
        }

        public void SaveAll(IList<IProgrammingLanguage> entities)
        {
            base.SaveAll<IProgrammingLanguage>(entities);
        }

        public void Delete(IProgrammingLanguage entity)
        {
            base.Delete<IProgrammingLanguage>(entity);
        }

        public IList<IProgrammingLanguage> GetActive()
        {
            return base.GetActive<IProgrammingLanguage>();
        }

        public IList<IProgrammingLanguage> GetAll()
        {
            return base.GetAll<IProgrammingLanguage>();
        }


        public void DeleteAll(IList<IProgrammingLanguage> entities)
        {
            base.DeleteAll<IProgrammingLanguage>(entities);
        }
    }
}
