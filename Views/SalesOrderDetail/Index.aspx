<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.SalesOrderDetail.SalesOrderDetail" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="sales-order-detail.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            Sales Order Details shows the sales invoice details using the <a
                href="https://help.boldreports.com/on-premise/report-designer/report-parameters/add/"
                target="_blank">report parameters</a>, line report item, and table formatting in Bold Reports Report
            Viewer.
        </p>
        <ul>
            <li>The Sales Order details are displayed dynamically using <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">expression</a> with the text box report item.</li>
            <li>The sales order details for each sales order number can be generated based on <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-parameters/add/"
                    target="_blank">Report Parameters</a> at run time.</li>
        </ul>
        <p>
            More information about handling the report items can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>