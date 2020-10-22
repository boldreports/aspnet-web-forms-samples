<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.NorthwindProductsSuppliersReport.NorthwindProductsSuppliersReport" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="northwind-products-suppliers-report.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            This demo showcases the details of products and suppliers of an organization and its sales ratio based on
            the market demand details using supported chart types
            such as pyramid, bar, and column charts, and table report item in Bold Reports Report Viewer.
        </p>
        <ul>
            <li>The font color is categorized using the <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/conditional-formatting-tablix-data-region/"
                    target="_blank">Conditional Formatting</a> feature in the <code>UnitInStock</code> column of table
                to differentiate the range of values.</li>
            <li>The <code>TopN</code> filter is applied to the <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/add-filters-to-tablix-data-region/"
                    target="_blank">table</a> and <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/add-filters-to-chart-data-region/"
                    target="_blank">chart</a> data regions to display the top five data from database. Similarly, the
                <code>BottomN</code> filter is applied to display the least demand products
                from database.</li>
        </ul>
        <p>
            More information about chart data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/"
                target="_blank">documentation</a> section.
        </p>

    </div>

</asp:Content>