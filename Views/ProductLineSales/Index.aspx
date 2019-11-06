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
            The Product Line Sales RDL report represents the top ten best performing sales people and stores. The sales
            details are organized by category and subcategory of products using the concept of
            <code>Cascading Parameters</code>. It
            allows users to filter parameters based on the previous parameters.
        </p>

        <p>
            Cascading parameter report designing steps can be found in this <a
                href="https://documentation.boldreports.com/on-premise/report-designer/report-parameters/create-cascading-parameter/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>