<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.SalesByYear.SalesByYear" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<Bold:ReportViewer runat="server" ID="Reports" OnClientReportLoaded="onReportLoaded" ReportPath="sales-by-year.rdlc" 
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
            This demos allows you to view the sales by year <b>RDLC</b> that exist on the <code>local</code> file system with JSON array and custom business object data collection.
        </p>
        <p>
            More information about RDLC report can be found in this <a href="https://documentation.boldreports.com/aspnet-web-forms/report-viewer/rdlc-report/" target="_blank">documentation</a> section.
        </p>
    </div>

</asp:content>
