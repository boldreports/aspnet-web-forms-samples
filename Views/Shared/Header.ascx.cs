using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReportsWebFormsSamples.Models;

namespace ReportsWebFormsSamples
{
    public partial class Header : System.Web.UI.UserControl
    {
        public static dynamic sampledata = SampleData.getSampleData();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}