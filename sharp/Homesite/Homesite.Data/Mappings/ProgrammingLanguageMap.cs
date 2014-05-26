using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using FluentNHibernate.Mapping;
using Homesite.Data.Entities;


namespace Homesite.Data.Mappings
{
    public class ProgrammingLanguageMap: ClassMap<ProgrammingLanguage>
    {
        public ProgrammingLanguageMap()
        {
            Table("programming_languages");

            Id(x => x.Id).GeneratedBy.Sequence("seq_programming_languages");
            Map(x => x.Active);
            Map(x => x.DateCreated);
            Map(x => x.Name);
            Map(x => x.ReferenceUrl);


        }
    }
}
