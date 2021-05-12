using BoldReports.Web;
using BoldReports.Writer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace ReportsWebFormsSamples.Controllers
{
    [System.Web.Http.Cors.EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("")]
    public class ReportWriterController : ApiController
    {

        public string getName(string name)
        {
            string[] splittedNames = name.Split('-');
            string sampleName = "";
            foreach (string splittedName in splittedNames)
            {
                sampleName += (char.ToUpper(splittedName[0]) + splittedName.Substring(1));
            }
            return sampleName;
        }

        [HttpPost]
        public void generate(string reportName, string type)
        {
            try
            {
                string fileName = reportName.Contains("-") ? getName(reportName) : (char.ToUpper(reportName[0]) + reportName.Substring(1));
                WriterFormat format;
                HttpContext httpContext = System.Web.HttpContext.Current;
                string resourcesPath = HttpContext.Current.Server.MapPath("~/Scripts");
                ReportWriter reportWriter = new ReportWriter();
                reportWriter.ReportProcessingMode = ProcessingMode.Remote;
                reportWriter.ExportResources.UsePhantomJS = true;
                reportWriter.ExportResources.PhantomJSPath = resourcesPath + @"\PhantomJS\";
                reportWriter.ReportPath = HttpContext.Current.Server.MapPath("~/Resources/Report/" + reportName + ".rdl");

                reportWriter.ExportResources.Scripts = new List<string>
                {
                    //Gauge component scripts
                    "../../bold-reports/common/ej2-base.min.js",
                    "../../bold-reports/common/ej2-pdf-export.min.js",
                    "../../bold-reports/common/ej2-svg-base.min.js",
                    "../../bold-reports/data-visualization/ej2-lineargauge.min.js",
                    "../../bold-reports/data-visualization/ej2-circulargauge.min.js",

                    "../../bold-reports/common/bold.reports.common.min.js",
                    "../../bold-reports/common/bold.reports.widgets.min.js",
                    //Chart component script
                    "../../bold-reports/data-visualization/ej.chart.min.js",
                    //Report Viewer Script
                    "../../bold-reports/bold.report-viewer.min.js"
                };

                reportWriter.ExportResources.DependentScripts = new List<string>
                {
                    "../../dependent/jquery.min.js"
                };

                if (type == "pdf")
                {
                    fileName += ".pdf";
                    format = WriterFormat.PDF;
                }
                else if (type == "word")
                {
                    fileName += ".docx";
                    format = WriterFormat.Word;
                }
                else if (type == "html")
                {
                    fileName += ".Html";
                    format = WriterFormat.HTML;
                }
                else if (type == "csv")
                {
                    fileName += ".csv";
                    format = WriterFormat.CSV;
                }
                else if (type == "ppt")
                {
                    fileName += ".ppt";
                    format = WriterFormat.PPT;
                }
                else
                {
                    fileName += ".xlsx";
                    format = WriterFormat.Excel;
                }
                reportWriter.Save(fileName, format, httpContext.Response);
            }
            catch { }
        }
    }
}
