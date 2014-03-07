using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using NUnit.Framework;
using FlaggLib4Net.Web.Utilities;

namespace FlaggLib4Net.Tests.Web.Utilities
{
    [TestFixture]
    public class GoogleUrlShortenerTests
    {
        [TestCase]
        public void TestShortenUrl()
        {
            String apiKey = ConfigurationManager.AppSettings["google.api.key"];

            GoogleUrlShortener shortener = new GoogleUrlShortener(apiKey);

            string originalUrl = "http://rickflagg.net";

            string shortUrl = shortener.ShortenUrl(originalUrl);

            Assert.AreNotEqual(originalUrl, shortUrl);

        }
    }
}
