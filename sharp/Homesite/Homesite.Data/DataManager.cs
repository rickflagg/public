using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Homesite.Data.Entities;
using Homesite.Data.Repositories;
using Homesite.Contracts.Data.Entities;
using Homesite.Contracts.Data.Repository;

namespace Homesite.Data
{
    public static class DataManager
    {
        public static void PopulateData()
        {
            IDesignPatternRepository designPatternRepo = new DesignPatternRepository();
            IProgrammingLanguageRepository programmingLanguageRepo = new ProgrammingLanguageRepository();
            IProgrammingToolkitRepository programmingToolkitRepo = new ProgrammingToolkitRepository();
            IDatabasePlatformRepository databaseRepo = new DatabasePlatformRepository();
            ISoftwareLifecycleRepository lifecycleRepo = new SoftwareLifecycleRepository();
            IRoleRepository roleRepo = new RoleRepository();
            IClientRepository clientRepo = new ClientRepository();

            //Create the Design Patterns
            designPatternRepo.SaveAll(DataManager.CreateDesignPatterns());

            //Create the Programming Languages
            programmingLanguageRepo.SaveAll(DataManager.CreateProgrammingLanguages());

            //Create the Programming Toolkits
            programmingToolkitRepo.SaveAll(DataManager.CreateProgrammingToolkits());

            //Create the Database Platforms
            databaseRepo.SaveAll(DataManager.CreateDatabasePlatforms());

            //Create the Software Lifecycles
            lifecycleRepo.SaveAll(DataManager.CreateSoftwareLifecycles());

            //Create the Roles
            roleRepo.SaveAll(DataManager.CreateRoles());

            //Create the Clients
            clientRepo.SaveAll(DataManager.CreateClients());

        }

        public static void RemoveData()
        {
            IDesignPatternRepository designPatternRepo = new DesignPatternRepository();
            IProgrammingLanguageRepository programmingLanguageRepo = new ProgrammingLanguageRepository();
            IProgrammingToolkitRepository programmingToolkitRepo = new ProgrammingToolkitRepository();
            IDatabasePlatformRepository databaseRepo = new DatabasePlatformRepository();
            ISoftwareLifecycleRepository lifecycleRepo = new SoftwareLifecycleRepository();
            IRoleRepository roleRepo = new RoleRepository();
            IClientRepository clientRepo = new ClientRepository();

            //Remove the design patterns
            designPatternRepo.DeleteAll(designPatternRepo.GetAll());
            //Remove the programming languages
            programmingLanguageRepo.DeleteAll(programmingLanguageRepo.GetAll());
            //Remove the programming toolkits
            programmingToolkitRepo.DeleteAll(programmingToolkitRepo.GetAll());
            //Remove the database platforms
            databaseRepo.DeleteAll(databaseRepo.GetAll());
            //Remove the software lifecycles
            lifecycleRepo.DeleteAll(lifecycleRepo.GetAll());
            //Remove the roles
            roleRepo.DeleteAll(roleRepo.GetAll());
            //Remove the clients
            clientRepo.DeleteAll(clientRepo.GetAll());
        }

        private static IList<IClient> CreateClients()
        {
            IList<IClient> retval = new List<IClient>();

            retval.Add
            (
                new Client()
                {
                    Name = "Banner Consulting",
                    Active = true,
                    DateCreated = DateTime.Now
                }
            );

            retval.Add
            (
                new Client()
                {
                    Name = "U.S Census Bureau",
                    Active = true,
                    DateCreated = DateTime.Now
                }
            );


            return retval;
        }

        private static IList<IRole> CreateRoles()
        {
            IList<IRole> retval = new List<IRole>();

            retval.Add
                (
                    new Role()
                    {
                        Name = "Software Developer",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );


            retval.Add
                (
                    new Role()
                    {
                        Name = "Technical Lead",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            retval.Add
                (
                    new Role()
                    {
                        Name = "Project Manager",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            retval.Add
                (
                    new Role()
                    {
                        Name = "Scrum Master",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            retval.Add
                (
                    new Role()
                    {
                        Name = "Architect",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );


            retval.Add
                (
                    new Role()
                    {
                        Name = "Configuration Manager",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );


            retval.Add
                (
                    new Role()
                    {
                        Name = "Tester",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );


            retval.Add
                (
                    new Role()
                    {
                        Name = "Requirement Analyst",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );


            retval.Add
                (
                    new Role()
                    {
                        Name = "Tester",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );


            return retval;
        }

        private static IList<IDatabasePlatform> CreateDatabasePlatforms()
        {
            IList<IDatabasePlatform> retval = new List<IDatabasePlatform>();

            retval.Add
                (
                    new DatabasePlatform()
                    {
                        Name = "Oracle",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            retval.Add
                 (
                     new DatabasePlatform()
                     {
                         Name = "SQL Server",
                         Active = true,
                         DateCreated = DateTime.Now
                     }
                 );

            retval.Add
                 (
                     new DatabasePlatform()
                     {
                         Name = "Postgresql",
                         Active = true,
                         DateCreated = DateTime.Now
                     }
                 );

            retval.Add
                 (
                     new DatabasePlatform()
                     {
                         Name = "MySQL",
                         Active = true,
                         DateCreated = DateTime.Now
                     }
                 );

            retval.Add
                 (
                     new DatabasePlatform()
                     {
                         Name = "Firebird",
                         Active = true,
                         DateCreated = DateTime.Now
                     }
                 );

            return retval;
        }

        private static IList<ISoftwareLifecycle> CreateSoftwareLifecycles()
        {
            IList<ISoftwareLifecycle> retval = new List<ISoftwareLifecycle>();

            retval.Add
                (
                    new SoftwareLifecycle()
                    {
                        Name = "Waterfall",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            retval.Add
                (
                    new SoftwareLifecycle()
                    {
                        Name = "Spiral",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            retval.Add
                (
                    new SoftwareLifecycle()
                    {
                        Name = "Iterative",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            retval.Add
                (
                    new SoftwareLifecycle()
                    {
                        Name = "Agile",
                        Active = true,
                        DateCreated = DateTime.Now
                    }
                );

            return retval;
        }

        private static IList<IProgrammingToolkit> CreateProgrammingToolkits()
        {
            IList<IProgrammingToolkit> retval = new List<IProgrammingToolkit>();

            retval.Add(new
                ProgrammingToolkit()
                {
                   Name = "Windows Presentation Foundation",
                   Active = true,
                   DateCreated = DateTime.Now,
                   ReferenceUrl = "http://msdn.microsoft.com/en-us/library/ms754130(v=vs.110).aspx"
                }
            );

            retval.Add(new
                ProgrammingToolkit()
            {
                Name = "Nancy",
                Active = true,
                DateCreated = DateTime.Now,
                ReferenceUrl = "http://nancyfx.org/"
            }
            );


            retval.Add(new
                ProgrammingToolkit()
            {
                Name = "Log4Net",
                Active = true,
                DateCreated = DateTime.Now,
                ReferenceUrl = "http://logging.apache.org/log4net/"
            }
            );




            return retval;
        }

        private static IList<IProgrammingLanguage> CreateProgrammingLanguages()
        {
            IList<IProgrammingLanguage> retval = new List<IProgrammingLanguage>();

            retval.Add
                (
                    new ProgrammingLanguage()
                    {
                        Name = "C#",
                        Active = true,
                        DateCreated = DateTime.Now,
                        ReferenceUrl = "http://msdn.microsoft.com/en-us/library/618ayhy6.aspx"
                    }
                );

            retval.Add
                (
                    new ProgrammingLanguage()
                    {
                        Name = "Java",
                        Active = true,
                        DateCreated = DateTime.Now,
                        ReferenceUrl = "http://docs.oracle.com/javase/7/docs/api/"
                    }
                );

            retval.Add
                (
                    new ProgrammingLanguage()
                    {
                        Name = "Python",
                        Active = true,
                        DateCreated = DateTime.Now,
                        ReferenceUrl = "https://docs.python.org/3/library/"
                    }
                );

            retval.Add
                (
                    new ProgrammingLanguage()
                    {
                        Name = "Javascript",
                        Active = true,
                        DateCreated = DateTime.Now,
                        ReferenceUrl = "https://developer.mozilla.org/en-US/docs/Web/JavaScript"
                    }
                );

            return retval;
        }

        private static IList<IDesignPattern> CreateDesignPatterns()
        {
            IList<IDesignPattern> retval = new List<IDesignPattern>();

            retval.Add(

                new DesignPattern()
                {
                    Name = "Model View Controller",
                    ReferenceUrl = "http://martinfowler.com/eaaCatalog/modelViewController.html",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Service Layer",
                    ReferenceUrl = "http://martinfowler.com/eaaCatalog/serviceLayer.html",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Model View ViewModel",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Model_View_ViewModel",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Model View Presenter",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Builder",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Builder_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Singleton",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Singleton_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Adapter",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Adapter_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );


            retval.Add(

                new DesignPattern()
                {
                    Name = "Decorator",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Decorator_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Facade",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Facade_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Proxy",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Proxy_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Mediator",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Mediator_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Memento",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Memento_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            retval.Add(

                new DesignPattern()
                {
                    Name = "Observer",
                    ReferenceUrl = "http://en.wikipedia.org/wiki/Observer_pattern",
                    Active = true,
                    DateCreated = DateTime.Now
                }

            );

            return retval;
        }

    }
}
