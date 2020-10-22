<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.LoadLargeData.LoadLargeData" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<Bold:ReportViewer runat="server" ID="Reports" OnClientReportLoaded="onReportLoaded" ReportPath="load-large-data.rdlc" 
    processingMode="Local" ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering" OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>
   
    <script>
        function onReportLoaded(args) {
       }
    </script>

</asp:Content>

<asp:content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

       <div id="description">
        <p>
            This report shows 100,000 records of sales order details using the <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">Tablix</a> report item in RDLC report.
        </p>
        <ul>
            <li>The table is displayed with a total row, and the sum of sales is calculated by aggregation of
                <code>OrderQty</code> and <code>UnitPrice</code> data fields using the <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">Expression</a> support.</li>
            <li>The Item total data text box is formatted in Currency format to enhance the report design.</li>
        </ul>
        <p>
            More information about RDLC report can be found in this <a
                href="https://help.boldreports.com/javascript/report-viewer/rdlc-report/" target="_blank">documentation</a>
            section.
        </p>

    </div>

</asp:content>
