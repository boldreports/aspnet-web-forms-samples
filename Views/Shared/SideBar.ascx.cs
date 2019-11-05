using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ReportsWebFormsSamples.Models;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportsWebFormsSamples.Common
{
    public partial class SideBar : System.Web.UI.UserControl
    {
        public static dynamic sampledata = SampleData.getSampleData();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}