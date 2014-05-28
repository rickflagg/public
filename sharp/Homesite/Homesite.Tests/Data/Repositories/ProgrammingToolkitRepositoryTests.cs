using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using Homesite.Contracts.Data.Entities;
using Homesite.Contracts.Data.Repository;
using Homesite.Data;
using Homesite.Data.Entities;
using Homesite.Data.Repositories;



namespace Homesite.Tests.Data.Repositories
{
    [TestClass]
    public class ProgrammingToolkitRepositoryTests
    {
        [TestInitialize]
        public void InitializeDatabase()
        {
            DataManager.PopulateData();
        }

        [TestCleanup]
        public void RemoveData()
        {
            DataManager.RemoveData();
        }



        [TestMethod]
        public void TestPersistence()
        {

        }
    }
}
