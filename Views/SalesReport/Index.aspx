<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.SalesReport.SalesReport" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="sales-report.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            This demo shows the sales order details using the table report item.
        </p>
        <ul>
            <li>The table is displayed with a total row, and the sum of sales is calculated by aggregation of
                <code>OrderQty</code> and <code>UnitPrice</code> data fields using the <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">Expression</a> support.</li>
            <li>The <code>Item Total</code> data text box is formatted in <b>Currency </b> <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/format-data/"
                    target="_blank">format</a> to enhance the report design.</li>
        </ul>
        <p>
            More information about the Tablix data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>