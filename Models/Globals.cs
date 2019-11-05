using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace ReportsWebFormsSamples.Models
{
    public class Globals
    {
        public static string basePath = HttpContext.Current.Request.ApplicationPath == "/" ? "/" : HttpContext.Current.Request.ApplicationPath + "/";
        public string SERVICE_URL = basePath + "api/ReportViewerWebApi";
        public string DESIGNER_SERVICE_URL = basePath + "api/ReportDesignerWebApi";
    }
}
