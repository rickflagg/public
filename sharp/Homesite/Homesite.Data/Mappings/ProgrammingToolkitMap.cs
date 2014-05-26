using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FluentNHibernate.Mapping;
using Homesite.Data.Entities;


namespace Homesite.Data.Mappings
{
    public class ProgrammingToolkitMap: ClassMap<ProgrammingToolkit>
    {
        public ProgrammingToolkitMap()
        {
            Table("programming_toolkits");

            Id(x => x.Id).GeneratedBy.Sequence("seq_programming_toolkits");
            Map(x => x.Active);
            Map(x => x.DateCreated);
            Map(x => x.Name);
            Map(x => x.ReferenceUrl);


        }
    }
}
