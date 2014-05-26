using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Repository;
using Homesite.Contracts.Data.Entities;

namespace Homesite.Data.Repositories
{
    public class DesignPatternRepository: BaseRepository, IDesignPatternRepository
    {

        public void Save(IDesignPattern entity)
        {
            base.Save<IDesignPattern>(entity);
        }

        public void SaveAll(IList<IDesignPattern> entities)
        {
            base.SaveAll<IDesignPattern>(entities);
        }

        public void Delete(IDesignPattern entity)
        {
            base.Delete<IDesignPattern>(entity);
        }

        public IList<IDesignPattern> GetActive()
        {
            return base.GetActive<IDesignPattern>();
        }

        public IList<IDesignPattern> GetAll()
        {
            return base.GetAll<IDesignPattern>();
        }
    }
}
