using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Homesite.Contracts.Data.Entities
{
    public interface IProject: IBaseEntitiy
    {
        DateTime? StartDate { get; set; }
        DateTime? EndDate { get; set; }
        IClient Client { get; set; }
        IList<IRole> Roles { get; set; }
        IList<IDatabasePlatform> DatabasePlatforms { get; set; }
        IList<IDesignPattern> DesignPatterns { get; set; }
        IList<IProgrammingLanguage> ProgrammingLanguages { get; set; }
        IList<IProgrammingToolkit> ProgrammingToolkits { get; set; }
        ISoftwareLifecycle SoftwareLifecycle { get; set; } 
    }
}
