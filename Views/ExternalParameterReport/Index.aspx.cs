using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportsWebFormsSamples.Views.ExternalParameterReport
{
    public partial class ExternalParameterReport : Preview
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Reports.ParameterSettings = new BoldReports.Models.ReportViewer.ParameterSettings();
            this.Reports.ParameterSettings.HideParameterBlock = true;

        }
    }
}