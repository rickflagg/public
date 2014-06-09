using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using Homesite.Data;

namespace Homesite.Tests.Data
{
    [TestClass]
    public class DataManagerTests
    {
        [TestMethod]
        public void TestPopulation()
        {
            DataManager.RemoveData();

            Assert.IsFalse(DataManager.IsDatabasePopulated);

            DataManager.PopulateData();

            Assert.IsTrue(DataManager.IsDatabasePopulated);

            DataManager.RemoveData();
        }
    }
}
