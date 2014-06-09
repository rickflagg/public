using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Entities;

namespace Homesite.Data.Entities
{
    public class Project: BaseEntity , IProject
    {

        public virtual DateTime? StartDate { get; set; }
        public virtual DateTime? EndDate { get; set; }
        public virtual IClient Client { get; set; }
        public virtual IList<IRole> Roles { get; set; }
        public virtual IList<IDatabasePlatform> DatabasePlatforms { get; set; }
        public virtual IList<IDesignPattern> DesignPatterns { get; set; }
        public virtual IList<IProgrammingLanguage> ProgrammingLanguages { get; set; }
        public virtual IList<IProgrammingToolkit> ProgrammingToolkits { get; set; }
        public virtual ISoftwareLifecycle SoftwareLifecycle { get; set; }

        public Project()
        {
            this.Roles = new List<IRole>();
            this.DatabasePlatforms = new List<IDatabasePlatform>();
            this.DesignPatterns = new List<IDesignPattern>();
            this.ProgrammingLanguages = new List<IProgrammingLanguage>();
            this.ProgrammingToolkits = new List<IProgrammingToolkit>();
        }

    }
}
