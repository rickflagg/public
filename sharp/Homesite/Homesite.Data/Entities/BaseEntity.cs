using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


using Homesite.Contracts.Data.Entities;

namespace Homesite.Data.Entities
{
    public class BaseEntity: IBaseEntitiy
    {
        public virtual long? Id { get; set; }
        public virtual string Name { get; set; }
        public virtual bool Active { get; set; }
        public virtual DateTime? DateCreated { get; set; }
    }
}
