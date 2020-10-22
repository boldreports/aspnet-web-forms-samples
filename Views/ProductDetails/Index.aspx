<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.productDetails.productDetails" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="product-details.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            The Product Details report lists the details defined for each product in database using the RDL table report
            item.
        </p>
        <ul>
            <li>Custom barcode report item is placed in a table cell to display the <code>ProductId</code>.</li>
            <li>The total price value of each product is calculated based on the <code>OrderQty</code> and
                <code>UnitPrice</code> data fields using <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">expression</a>.</li>
            <li>The price values in the product details are formatted in the <b>Currency </b> <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/format-data/"
                    target="_blank">format</a> to improve the readability of data.</li>
        </ul>
        <p>
            More information about the Tablix data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>