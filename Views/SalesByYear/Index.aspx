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
            The sales by year RDLC report represents the sales of North America countries in each year using <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">Tablix</a> and <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/" target="_blank">Chart</a>
            report items.
        </p>
        <ul>
            <li>The Row grouping feature is used to group the sales by year and the Column grouping feature is used to group
                Region and Country. More information about Grouping Panel can be found in this <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/grouping-panel/"
                    target="_blank">documentation</a> section.</li>
            <li>Aggregate functions are used to calculate the total sales in each countries.</li>
            <li><a href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/sort-data-in-tablix-data-region/"
                    target="_blank">Sorting</a> is applied to row groups to sort the sales year.</li>
        </ul>
        <p>
            More information about RDLC report can be found in this <a
                href="https://help.boldreports.com/javascript/report-viewer/rdlc-report/" target="_blank">documentation</a>
            section.
        </p>
    </div>

</asp:content>
