<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.TicketsSalesAnalysis.TicketsSalesAnalysis" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="tickets-sales-analysis.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            Tickets Sales Analysis report shows the sales analysis of movie tickets using RDL line, bar, and doughnut
            chart data regions and a table report item in Bold Report Viewer.
        </p>
        <ul>
            <li>Alternate row formatting is achieved using the <b>Conditional IIF Statement</b> to alternate the
                background color for a table data region,
                which improves the readability of data.</li>
            <li>The <code>TopN</code> filter is applied to bar chart to display the
                <code>Top 5 Shows based on Tickets Sold</code>. More information on filtering data with chart data
                region can be found in this <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/add-filters-to-chart-data-region/"
                    target="_blank">documentation</a> section.</li>
        </ul>
        <p>
            More information about chart data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>