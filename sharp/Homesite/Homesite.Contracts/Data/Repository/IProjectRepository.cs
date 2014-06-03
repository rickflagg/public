using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Homesite.Contracts.Data.Entities;


namespace Homesite.Contracts.Data.Repository
{
    public interface  IProjectRepository
    {
        void Save(IProject entity);
        void SaveAll(IList<IProject> entities);
        void Delete(IProject entity);
        void DeleteAll(IList<IProject> entities);
        IList<IProject> GetActive();
        IList<IProject> GetAll();
    }
}
