using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Contracts.Data.Entities;

namespace Homesite.Data.Entities
{
    public class DesignPattern: IDesignPattern
    {
        public virtual long? Id { get; set; }
        public virtual string Name { get; set; }
        public virtual string ReferenceUrl {get;set;}

        public virtual bool Active { get; set; }
        public virtual DateTime? DateCreated { get; set; }

    }
}
