using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReportsWebFormsSamples.Models;

namespace ReportsWebFormsSamples.Views.LoadLargeData
{
    public partial class LoadLargeData : Preview
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Reports.ToolbarSettings = new BoldReports.Models.ReportViewer.ToolbarSettings();
            this.Reports.ToolbarSettings.Items = BoldReports.ReportViewerEnums.ToolbarItems.All & ~BoldReports.ReportViewerEnums.ToolbarItems.Export & ~BoldReports.ReportViewerEnums.ToolbarItems.Print & ~BoldReports.ReportViewerEnums.ToolbarItems.ExportSetup;
        }
    }
}