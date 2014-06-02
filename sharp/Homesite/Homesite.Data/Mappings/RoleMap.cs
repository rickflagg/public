using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FluentNHibernate.Mapping;
using Homesite.Data.Entities;


namespace Homesite.Data.Mappings
{
    public class RoleMap: ClassMap<Role>
    {
        public RoleMap()
        {
            Table("roles");

            Id(x => x.Id).GeneratedBy.Sequence("seq_roles");
            Map(x => x.Active);
            Map(x => x.DateCreated);
            Map(x => x.Name);
        }
    }
}
