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

    }
}
