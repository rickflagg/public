using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;



namespace FlaggLib4Net.Web.Utilities
{
    /// <summary>
    /// Class that wraps the Google Url Shortener API
    /// </summary>
    public class GoogleUrlShortener
    {
        private const string googleShortenerApiUrl = "https://www.googleapis.com/urlshortener/v1/url";

        public string ApiKey { get; set; }

        /// <summary>
        /// Default Constructor with the Google API Key as a dependency
        /// </summary>
        /// <param name="apiKey"></param>
        public GoogleUrlShortener(string apiKey)
        {
            this.ApiKey = apiKey;
        }

        /// <summary>
        /// Method that shortens a url using the Google API 
        /// </summary>
        /// <param name="longUrl">Original long Url</param>
        /// <returns>A short representation of the original url</returns>
        public string ShortenUrl(string longUrl)
        {
            string retval = longUrl;

            if (!String.IsNullOrEmpty(longUrl) && !String.IsNullOrEmpty(this.ApiKey))
            {
               string url = googleShortenerApiUrl + "?key=" + this.ApiKey;

               WebClient client = new WebClient();
               client.Headers["Content-Type"] = "application/json";
               var response = client.UploadString(url, JsonConvert.SerializeObject(new { longUrl = longUrl }));

               retval = (string)JObject.Parse(response)["id"];
            
            }

            return retval;
        }

    }
}
