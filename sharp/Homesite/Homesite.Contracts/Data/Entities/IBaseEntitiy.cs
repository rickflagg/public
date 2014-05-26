using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Homesite.Contracts.Data.Entities
{
    public interface IBaseEntitiy
    {
        long? Id {get;set;}
        String Name { get; set; }
        bool Active { get; set; }
        DateTime? DateCreated { get; set; }
    }
}
