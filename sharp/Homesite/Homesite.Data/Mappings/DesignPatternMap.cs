using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FluentNHibernate.Mapping;
using Homesite.Data.Entities;

namespace Homesite.Data.Mappings
{
    public class DesignPatternMap: ClassMap<DesignPattern>
    {
        public DesignPatternMap()
        {
            Table("design_patterns");

            Id(x => x.Id).GeneratedBy.Sequence("seq_design_patterns");
            Map(x => x.Active);
            Map(x => x.DateCreated);
            Map(x => x.Name);
            Map(x => x.ReferenceUrl);

        }
    }
}
