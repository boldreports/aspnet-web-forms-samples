<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.ProductLineSales.ProductLineSales" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="product-line-sales.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            The Product Line Sales RDL report represents the best performing sales people and stores using <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">Tablix</a> and <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/" target="_blank">Chart</a>
            report items.
        </p>
        <ul>
            <li>The sales details are organized by category and sub-category of products using the concept of cascading
                parameters. It allows users to filter Sub Category based on the selected Category.</li>
            <li>Non cascading parameters namely start date and end date also used in this report.</li>
        </ul>
        <p>
            More information about Cascading Parameters can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-parameters/create-cascading-parameter/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>