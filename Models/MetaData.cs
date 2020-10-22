using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using ReportsWebFormsSamples.Models;

namespace ReportsWebFormsSamples.Views
{
    public class MetaData : System.Web.UI.Page
    {
        dynamic getReportSampleData(string controllerName)
        {
            dynamic samples = SampleData.getSampleData().samples;
            dynamic sampleData = null;
            foreach (dynamic sample in samples)
            {
                if ((sample.routerPath == "" && sample.basePath == controllerName) || sample.routerPath == controllerName)
                {
                    sampleData = sample;
                    break;
                }
            }
            return sampleData;
        }

        public void updateMetaData(bool isPreviewPage)
        {
            string sampleName = (string)HttpContext.Current.Items["sampleName"];
            bool isReportDesigner = String.IsNullOrEmpty(sampleName);
            dynamic sampleData;
            MetaDataInfo metaData;
            if (isPreviewPage)
            {
                if (isReportDesigner)
                {
                    string designerType = (string)HttpContext.Current.Items["designerType"];
                    string reportName = HttpContext.Current.Request.QueryString["report-name"];
                    if (!string.IsNullOrEmpty(reportName))
                    {
                        string formattedName = "";
                        string[] splittedNames = reportName.Split('.')[0].Split('-');
                        for (int i = 0; i < splittedNames.Length; i++)
                        {
                            formattedName += Char.ToUpper(splittedNames[i][0]) + splittedNames[i].Substring(1);
                        }
                        sampleData = getReportSampleData(formattedName.Trim());
                    }
                    else
                    {
                        sampleData = new { sampleName = designerType + " sample", metaData = new { title = "" } };
                    }

                    metaData = this.updateDesignerMetaData(sampleData);
                }
                else
                {
                    sampleData = getReportSampleData(sampleName);
                    metaData = this.updatePreviewMetaData(sampleData);
                }
            }
            else
            {
                sampleData = getReportSampleData(sampleName);
                metaData = this.updateSampleMetaData(sampleData);
            }
            this.Title = metaData.title;
            this.MetaDescription = metaData.metaContent;
        }

        public MetaDataInfo updateSampleMetaData(dynamic sampleData)
        {
            string title = String.IsNullOrEmpty((string)sampleData.metaData.title) ? sampleData.sampleName : sampleData.metaData.title;
            string basePath = new Regex(@"(?<!^)(?=[A-Z])").Replace((string)sampleData.basePath, " ", 1);
            title += " | ASP.NET Webforms " + basePath.Trim();
            title = title.Length < 45 ? title += " | Bold Reports" : title;
            return new MetaDataInfo(title, (string)sampleData.metaData.description);

        }

        public MetaDataInfo updatePreviewMetaData(dynamic sampleData)
        {
            string title = String.IsNullOrEmpty((string)sampleData.metaData.title) ? sampleData.sampleName : sampleData.metaData.title;
            string metaContent;
            switch ((string)sampleData.basePath)
            {
                case "ReportViewer":
                    metaContent = "The ASP.NET WebForms Bold Report Viewer allows the end-users to visualize the " + title + " report in browsers.";
                    title += " | Preview | ASP.NET Webforms Report Viewer";
                    break;
                case "ReportWriter":
                    title += " | Preview | ASP.NET Webforms Report Writer";
                    metaContent = "The ASP.NET WebForms Bold Report Writer allows the end-users to download the report in browsers without visualizing the report.";
                    break;
                default:
                    title = "";
                    metaContent = "";
                    break;
            }

            title = title.Length < 45 ? title += " | Bold Reports" : title;
            return new MetaDataInfo(title, metaContent);
        }

        public MetaDataInfo updateDesignerMetaData(dynamic sampleData)
        {
            string title = String.IsNullOrEmpty((string)sampleData.metaData.title) ? sampleData.sampleName : sampleData.metaData.title;
            string metaContent = "The ASP.NET WebForms bold report designer allows the end-users to arrange/customize the reports appearance in browsers." +
                        "It helps to edit the " + title + " for customer\"s application needs.";
            title += " | ASP.NET Webforms Report Designer";
            title = title.Length < 45 ? title += " | Bold Reports" : title;
            return new MetaDataInfo(title, metaContent);
        }


        public class MetaDataInfo
        {
            public string title { get; set; }
            public string metaContent { get; set; }

            public MetaDataInfo(string title, string metaContent)
            {
                this.title = title;
                this.metaContent = metaContent;
            }
        }
    }
}