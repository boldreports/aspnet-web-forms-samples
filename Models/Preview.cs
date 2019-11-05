using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReportsWebFormsSamples.Models;

namespace ReportsWebFormsSamples.Views
{
    public class Preview : MetaData
    {
        public Globals Globals = new Globals();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            bool isPreview = (bool)HttpContext.Current.Items["isPreview"];
            if (isPreview)
            {
                this.updateMetaData(true);
                this.MasterPageFile = "~/Views/Shared/Preview/PreviewSite.Master";
            }
            else
            {
                this.updateMetaData(false);
                this.MasterPageFile = "~/Views/Shared/Site.Master";
            }
        }
    }
}