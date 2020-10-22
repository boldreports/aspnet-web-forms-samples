<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.TerritorySales.TerritorySales" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="territory-sales.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            This demo shows the sales territory and its total sales using drilldown with table report in Bold Report
            Viewer. Rows with
            details are initially hidden with general summarized picture of the data, and data is drilled down to
            discover the sales order details.
        </p>

        <ul>
            <li>
                The data is grouped as a hierarchy using the <code>Row Grouping</code> feature with table data region.
            </li>
            <li>
                Interactive expand and collapse are achieved using the <code>Toggle</code> property in table data
                region.
            </li>
        </ul>
        <p>
            More information about the table data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>