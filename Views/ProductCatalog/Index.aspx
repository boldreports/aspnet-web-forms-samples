<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.ProductCatalog.ProductCatalog" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<Bold:ReportViewer runat="server" ID="Reports" OnClientReportLoaded="onReportLoaded" ReportPath="product-catalog.rdlc" 
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
            This report shows Mountain bike products information using the <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">Tablix</a> report item in RDLC report.
        </p>
        <ul>
            <li>The table is displayed with Product no, image, name, size, weight and cost.</li>
            <li>The data used in this table is a local JSON data.</li>
        </ul>
        <p>
            More information about RDLC report can be found in this <a
                href="https://help.boldreports.com/javascript/report-viewer/rdlc-report/" target="_blank">documentation</a>
            section.
        </p>
    </div>

</asp:content>
