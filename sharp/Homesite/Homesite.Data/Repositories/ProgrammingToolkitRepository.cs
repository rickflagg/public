using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Entities;
using Homesite.Contracts.Data.Repository;

namespace Homesite.Data.Repositories
{
    public class ProgrammingToolkitRepository: BaseRepository, IProgrammingToolkitRepository
    {

        public void Save(IProgrammingToolkit entity)
        {
            base.Save<IProgrammingToolkit>(entity);
        }

        public void SaveAll(IList<IProgrammingToolkit> entities)
        {
            base.SaveAll<IProgrammingToolkit>(entities);
        }

        public void Delete(IProgrammingToolkit entity)
        {
            base.Delete<IProgrammingToolkit>(entity);
        }

        public IList<IProgrammingToolkit> GetActive()
        {
            return base.GetActive<IProgrammingToolkit>();
        }

        public IList<IProgrammingToolkit> GetAll()
        {
            return base.GetAll<IProgrammingToolkit>();
        }


        public void DeleteAll(IList<IProgrammingToolkit> entities)
        {
            base.DeleteAll<IProgrammingToolkit>(entities);
        }
    }
}
