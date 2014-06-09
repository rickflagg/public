using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FluentNHibernate.Mapping;
using Homesite.Data.Entities;



namespace Homesite.Data.Mappings
{
    public class ProjectMap: ClassMap<Project>
    {
        public ProjectMap()
        {
            Table("projects");

            Id(x => x.Id).GeneratedBy.Sequence("seq_projects");

            Map(x => x.Active);
            References<Client>(x => x.Client).Column("client_id").Cascade.SaveUpdate();
            References<SoftwareLifecycle>(x => x.SoftwareLifecycle).Column("lifecycle_id").Cascade.SaveUpdate();
            HasManyToMany<DatabasePlatform>(x => x.DatabasePlatforms).Cascade.SaveUpdate().Table("project_database_platforms");
            HasManyToMany<DesignPattern>(x => x.DesignPatterns).Cascade.SaveUpdate().Table("project_design_patterns");
            HasManyToMany<ProgrammingLanguage>(x => x.ProgrammingLanguages).Cascade.SaveUpdate().Table("project_programming_languages");
            HasManyToMany<ProgrammingToolkit>(x => x.ProgrammingToolkits).Cascade.SaveUpdate().Table("project_programming_toolkits");
            HasManyToMany<Role>(x => x.Roles).Cascade.SaveUpdate().Table("project_roles");

        }
    }
}
