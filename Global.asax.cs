using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using ReportsWebFormsSamples.Models;
using System.Text;
using Bold.Licensing;
using System.IO;
using BoldReports.Base.Logger;
using BoldReports.Web;
using Newtonsoft.Json;
using System.Reflection;

namespace ReportsWebFormsSamples
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            log4net.GlobalContext.Properties["LogPath"] = this.GetAppDataFolderPath();
            BoldReports.Base.Logger.LogExtension.RegisterLog4NetConfig();
            // Register Bold Reports license
            string License = File.ReadAllText(Server.MapPath("BoldLicense.txt"), Encoding.UTF8);
            BoldLicenseProvider.RegisterLicense(License);
            ReportConfig.DefaultSettings = new ReportSettings()
            {
                MapSetting = this.GetMapSettings()
            }.RegisterExtensions(this.GetDataExtension());

            // Code that runs on application startup
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        private List<string> GetDataExtension()
        {
            var extensions = !string.IsNullOrEmpty(System.Configuration.ConfigurationManager.AppSettings["ExtAssemblies"]) ? System.Configuration.ConfigurationManager.AppSettings["ExtAssemblies"] : string.Empty;
            try
            {
                return new List<string>(extensions.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries));
            }
            catch (Exception ex)
            {
                LogExtension.LogError("Failed to Load Data Extension", ex, MethodBase.GetCurrentMethod());
            }
            return null;
        }

        ReportSample getSampleData(string reportBasePath, string reportRouterPath, ReportSample sampleData)
        {
            dynamic samples = SampleData.getSampleData().samples;
            foreach (dynamic sample in samples)
            {
                if (sample.routerPath == reportRouterPath && sample.basePath == reportBasePath)
                {
                    sampleData.isReportSample = true;
                    sampleData.routerPath = reportRouterPath;
                    sampleData.basePath = reportBasePath;
                }
            }
            return sampleData;
        }

        void Application_BeginRequest(Object sender, EventArgs e)
        {
            ReportSample sampleData = new ReportSample(); ;
            int pathLen;
            string path = HttpContext.Current.Request.Path;
            string basePath = HttpContext.Current.Request.ApplicationPath == "/" ? HttpContext.Current.Request.ApplicationPath : (HttpContext.Current.Request.ApplicationPath + "/");
            bool isinitialRouting = basePath == path || (basePath == path + "/");
            bool isRDLCReportDesigner = path.Contains("/ReportDesigner/RDLC") && !path.Contains("/api/");
            bool isReportDesigner = path.Contains("/ReportDesigner") && !path.Contains("/api/");
            string[] urlPaths = new Regex(basePath).Replace(path, "", 1).Split('/');
            pathLen = urlPaths.Length;
            if (pathLen > 0 && !isinitialRouting && !isReportDesigner && !path.Contains("/api/"))
            {
                string reportBasePath = urlPaths[0];
                string reportRouterPath;
                if (path.Contains("/Preview"))
                {
                    reportRouterPath = urlPaths[1] != "Preview" ? urlPaths[1] : "";
                }
                else
                {
                    reportRouterPath = pathLen > 1 ? urlPaths[1] : "";
                }
                sampleData = getSampleData(reportBasePath, reportRouterPath, sampleData);
            }
            HttpContext.Current.Items["isPreview"] = path.Contains("/Preview") || path.Contains("/ReportDesigner");
            bool sourceTab = HttpContext.Current.Request.QueryString.ToString().Contains("sourceTab=true");
            if (sourceTab)
            {
                string res = System.IO.File.ReadAllText(HttpContext.Current.Request.PhysicalPath);
                Response.Clear();
                Response.ClearHeaders();
                Response.AddHeader("Content-Type", "text/plain");
                Response.Write(res);
                Response.Flush();
                Response.End();
            }
            else if (isinitialRouting)
            {
                HttpContext.Current.Response.RedirectPermanent(basePath + "ReportViewer/ProductLineSales");
            }
            else if (isRDLCReportDesigner)
            {
                HttpContext.Current.Items["designerType"] = "RDLC";
                Context.RewritePath(path.Replace(path, "~/Views/RDLC/Index.aspx"));
            }
            else if (isReportDesigner)
            {
                HttpContext.Current.Items["designerType"] = "RDL";
                Context.RewritePath(path.Replace(path, "~/Views/ReportDesigner/Index.aspx"));
            }
            else if (sampleData.isReportSample)
            {
                string reportRouterPath = sampleData.routerPath == "" ? sampleData.basePath : sampleData.routerPath;
                HttpContext.Current.Items["sampleName"] = reportRouterPath;
                Context.RewritePath(path.Replace(path, "~/Views/" + reportRouterPath + "/Index.aspx"));
            }

        }
        public string GetAppDataFolderPath()
        {
            try
            {
                return System.IO.Path.GetFullPath(AppDomain.CurrentDomain.BaseDirectory);
            }
            catch
            {
                return null;
            }
        }

        private BoldReports.Web.MapSetting GetMapSettings()
        {
            try
            {
                string basePath = HttpContext.Current.Server.MapPath("~/Scripts");
                return new MapSetting()
                {
                    ShapePath = basePath + "\\ShapeData\\",
                    MapShapes = JsonConvert.DeserializeObject<List<MapShape>>(System.IO.File.ReadAllText(basePath + "\\ShapeData\\mapshapes.txt"))
                };
            }
            catch (Exception ex)
            {
                LogExtension.LogError("Failed to Load Map Settings", ex, MethodBase.GetCurrentMethod());
            }
            return null;
        }
    }

    public class ReportSample
    {
        public bool isReportSample
        {
            get;
            set;
        }

        public string basePath
        {
            get;
            set;
        }

        public string routerPath
        {
            get;
            set;
        }

        public ReportSample()
        {
            this.isReportSample = false;
            this.basePath = "";
            this.routerPath = "";
        }
    }
}