<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.CompanySales.CompanySales" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="company-sales.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>
    <style>
        .e-reportviewer-toggleicon {
            color: #fff;
        }
    </style>
</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            Company Sales report illustrates the product sales against a year using RDL Tablix report item in a
            cross-tabular format. Report is designed with drill-up and drill-down capabilities to easily view aggregate
            data
            of each quarterly sales in a year.
        </p>

        <ul>
            <li>The <b>Row</b> and <b>column</b> grouping feature is used to create a cross-tabular format. The report
                is
                designed with
                single row group and column group, each has a parent and child group.</li>
            <li><b>Aggregate</b> functions are used to calculate the total sales in row and column groups.</li>
            <li>Sorting is applied to row groups to sort the product category and sub-category in descending and
                ascending
                orders. More information about sorting data in matrix groups can be found in this <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/sort-data-in-tablix-data-region/#set-sort-expression-on-a-tablix-group"
                    target="_blank">documentation</a> section.
            </li>
        </ul>
        <p>
            Company Sales report designing steps can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/matrix/design-ssrs-matrix-report/#format-matrix-design"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>