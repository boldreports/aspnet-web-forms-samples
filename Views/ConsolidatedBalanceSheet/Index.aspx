<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.ConsolidatedBalanceSheet.ConsolidatedBalanceSheet" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<Bold:ReportViewer runat="server" ID="Reports" OnClientReportLoaded="onReportLoaded" ReportPath="consolidated-balance-sheet.rdlc" 
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
            Consolidated balance sheet RDLC report represents the assets and liabilities of a company and all subsidiaries
            for the last four quarters in a single sheet using <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">Tablix</a> report item.
        </p>
        <ul>
            <li>The <a href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/grouping-panel/"
                    target="_blank">Row grouping</a> feature is used to group the Assets type.</li>
            <li>Text box report items with currency value are formatted using <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">expression</a>.</li>
            <li>The data used in this table is a local JSON data.</li>
        </ul>
        <p>
            More information about RDLC report can be found in this <a
                href="https://help.boldreports.com/javascript/report-viewer/rdlc-report/" target="_blank">documentation</a>
            section.
        </p>
    </div>

</asp:content>
