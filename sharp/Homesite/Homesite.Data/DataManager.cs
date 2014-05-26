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

            //Create the Design Patterns
            designPatternRepo.SaveAll(DataManager.CreateDesignPatterns());

        }

        public static void RemoveData()
        {
            IDesignPatternRepository designPatternRepo = new DesignPatternRepository();

            //Remove the Design Patterns
            foreach (IDesignPattern pattern in designPatternRepo.GetAll())
            {
                designPatternRepo.Delete(pattern);
            }

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
