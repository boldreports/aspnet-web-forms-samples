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
                ReportWriter reportWriter = new ReportWriter();
                reportWriter.ReportProcessingMode = ProcessingMode.Remote;
                reportWriter.ReportPath = HttpContext.Current.Server.MapPath("~/Resources/Report/" + reportName + ".rdl");


                var resourcesPath = HttpContext.Current.Server.MapPath("~/Scripts");

                reportWriter.ExportResources.Scripts = new List<string>
                {
                    resourcesPath + @"\bold-reports\common\bold.reports.common.min.js",
                    resourcesPath + @"\bold-reports\common\bold.reports.widgets.min.js",
                    //Chart component script
                    resourcesPath + @"\bold-reports\data-visualization\ej.chart.min.js",
                    //Gauge component scripts
                    resourcesPath + @"\bold-reports\data-visualization\ej.lineargauge.min.js",
                    resourcesPath + @"\bold-reports\data-visualization\ej.circulargauge.min.js",
                    //Map component script
                    resourcesPath + @"\bold-reports\data-visualization\ej.map.min.js",
                    //Report Viewer Script
                    resourcesPath + @"\bold-reports\bold.report-viewer.min.js"
                };

                reportWriter.ExportResources.DependentScripts = new List<string>
                {
                    resourcesPath + @"\dependent\jquery.min.js"
                };

                if (type == "pdf")
                {
                    fileName += ".pdf";
                    format = WriterFormat.PDF;
                }
                else if (type == "word")
                {
                    fileName += ".doc";
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
                    fileName += ".xls";
                    format = WriterFormat.Excel;
                }
                reportWriter.Save(fileName, format, httpContext.Response);
            }
            catch { }
        }
    }
}
