using System.Web;
using System.Web.Optimization;

namespace ReportsWebFormsSamples
{
    public class CssUrlTransformWrapper : IItemTransform
    {
        private readonly CssRewriteUrlTransform _cssRewriteUrlTransform;

        public CssUrlTransformWrapper()
        {
            _cssRewriteUrlTransform = new CssRewriteUrlTransform();
        }

        public string Process(string includedVirtualPath, string input)
        {
            return _cssRewriteUrlTransform.Process("~" + VirtualPathUtility.ToAbsolute(includedVirtualPath), input);
        }
    }
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            BundleTable.EnableOptimizations = true;

            //Vendor scripts for SB main samples
            bundles.Add(new ScriptBundle("~/bundles/main/vendor").Include(

                      //dependent
                      "~/Scripts/dependent/prism.js",
                      "~/Scripts/dependent/prism-csharp.min.js",
                      "~/Scripts/dependent/jquery.min.js",
                      "~/Scripts/dependent/jsrender.min.js",
                      "~/Scripts/dependent/popper.min.js",
                      "~/Scripts/dependent/bootstrap.min.js",

                      //bold-reports
                      "~/Scripts/bold-reports/common/bold.reports.common.min.js",
                      "~/Scripts/bold-reports/common/bold.reports.widgets.min.js",
                      "~/Scripts/bold-reports/bold.report-viewer.min.js",
                      "~/Scripts/bold-reports/data-visualization/ej.bulletgraph.min.js",
                      "~/Scripts/bold-reports/data-visualization/ej.chart.min.js"));

            //App scripts for SB main samples
            bundles.Add(new ScriptBundle("~/bundles/main/app").Include(
                      "~/Scripts/common/global.js",
                      "~/Scripts/common/rdlcData.js",
                      "~/Scripts/common/header.js",
                      "~/Scripts/common/main-content.js",
                      "~/Scripts/common/sidebar.js",
                      "~/Scripts/common/index.js"));


            //styles for SB main samples
            bundles.Add(new StyleBundle("~/Content/main")
                    .Include("~/Content/css/dependent/bootstrap.min.css")
                    .Include("~/Content/css/dependent/prism.css")
                    .Include("~/Content/css/common/common.css")
                    .Include("~/Content/css/common/header.css")
                    .Include("~/Content/css/common/main-content.css")
                    .Include("~/Content/css/common/sidebar.css", new CssUrlTransformWrapper())
                    .Include("~/Content/css/common/writer.css", new CssUrlTransformWrapper())
                    .Include("~/Content/css/common/index.css", new CssUrlTransformWrapper())
                    .Include("~/Content/css/bold-reports/bold.widgets.core.material.min.css", new CssUrlTransformWrapper())
                    .Include("~/Content/css/bold-reports/material/bold.theme.min.css", new CssUrlTransformWrapper())
            );

            //vendor scripts for SB preview samples
            bundles.Add(new ScriptBundle("~/bundles/preview/vendor").Include(

                      //dependent
                      "~/Scripts/dependent/jquery.min.js",
                      "~/Scripts/dependent/jsrender.min.js",
                      "~/Scripts/dependent/codemirror.js",
                      "~/Scripts/dependent/show-hint.js",
                      "~/Scripts/dependent/sql-hint.js",
                      "~/Scripts/dependent/sql.js",
                      "~/Scripts/dependent/vb.js",

                      //bold-reports
                      "~/Scripts/bold-reports/common/bold.reports.common.min.js",
                      "~/Scripts/bold-reports/common/bold.reports.widgets.min.js",
                      "~/Scripts/bold-reports/bold.report-viewer.min.js",
                      "~/Scripts/bold-reports/common/bold.report-designer-widgets.min.js",
                      "~/Scripts/bold-reports/bold.report-designer.min.js",
                      "~/Scripts/extensions/barcode.js",
                      "~/Scripts/extensions/qrbarcode.js",
                      "~/Scripts/bold-reports/data-visualization/ej.bulletgraph.min.js",
                      "~/Scripts/bold-reports/data-visualization/ej.chart.min.js"));

            //App scripts for SB preview samples
            bundles.Add(new ScriptBundle("~/bundles/preview/app").Include(
                      "~/Scripts/common/global.js",
                      "~/Scripts/common/rdlcData.js",
                      "~/Scripts/common/preview.js"));

            //styles for SB preview samples
            bundles.Add(new StyleBundle("~/Content/preview")
                   .Include("~/Content/css/dependent/bootstrap.min.css")
                   .Include("~/Content/css/dependent/codemirror.css")
                   .Include("~/Content/css/dependent/show-hint.css")
                   .Include("~/Content/css/common/common.css")
                   .Include("~/Content/css/common/writer.css", new CssUrlTransformWrapper())
                   .Include("~/Content/css/common/preview.css")
                   .Include("~/Content/css/bold-reports/bold.widgets.core.material.min.css", new CssUrlTransformWrapper())
                   .Include("~/Content/css/bold-reports/material/bold.theme.min.css", new CssUrlTransformWrapper())
                   .Include("~/Content/css/bold-reports/bold.reportdesigner.core.material.min.css", new CssUrlTransformWrapper())
                   .Include("~/Content/css/bold-reports/material/bold.reportdesigner.theme.min.css", new CssUrlTransformWrapper())
                   .Include("~/Content/extensions/barcode.css", new CssUrlTransformWrapper()));
        }

    }
}
