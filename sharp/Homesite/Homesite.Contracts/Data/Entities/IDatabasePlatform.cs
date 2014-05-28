using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Homesite.Contracts.Data.Entities
{
    public interface IDatabasePlatform: IBaseEntitiy
    {
        String ReferenceUrl { get; set; }
        int Version { get; set; }
    }
}
