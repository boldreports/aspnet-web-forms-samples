using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Hosting;
using Newtonsoft.Json;
using System.Web;

namespace ReportsWebFormsSamples.Models
{
    public class SampleData
    {
        public static dynamic getSampleData()
        {
            string json = System.IO.File.ReadAllText(HostingEnvironment.MapPath(@"~/Scripts/samples.json"));
            dynamic sampleJson = JsonConvert.DeserializeObject(json);
            return sampleJson;
        }
    }
}
