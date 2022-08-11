<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.SparkLine.SparkLine" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<Bold:ReportViewer runat="server" ID="Reports" OnClientReportLoaded="onReportLoaded" ReportPath="spark-line.rdlc" 
    processingMode="Local" ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering" OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>
   
    <script>
        function onReportLoaded(args) {
            let reportNameWithoutExt = args.model.reportPath.split(".")[0];
            let reportObj = $(<%=Reports.ClientID%>).data('boldReportViewer');;
            reportObj.model.dataSources = rdlcData[reportNameWithoutExt];
        }
    </script>

</asp:Content>

<asp:content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            A sparkline is a small embedded line graph that illustrates a single trend. In this report, sales data are
            interpreted to visualize the sales trends using <a
                href="https://help.boldreports.com/embedded-reporting/react-reporting/report-designer/designer-guide/report-items/sparkline/"
                target="_blank">Spark Line</a> report items.
        </p>
        <p>
            More information about RDLC report can be found in this <a
                href="https://help.boldreports.com/javascript/report-viewer/rdlc-report/" target="_blank">documentation</a>
            section.
        </p>
    </div>

</asp:content>