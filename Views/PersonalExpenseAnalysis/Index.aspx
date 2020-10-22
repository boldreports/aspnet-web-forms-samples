<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.PersonalExpenseAnalysis.PersonalExpenseAnalysis" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="personal-expense-analysis.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            The monthly expense data of an individual is presented as a report using embedded images, text boxes, chart,
            and table data regions
            in Bold Reports Report Viewer. Thereby, it makes the process of analyzing and tracking monthly spending
            patterns easier.
        </p>
        <ul>
            <li>RDL External image embedding concept is used to display the image in report.</li>
            <li>Text box report items with <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">expressions</a> are used to format the currency data fields.</li>
            <li>Alternate row formatting is applied in the table data region using the <a
                    href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/conditional-formatting-tablix-data-region/"
                    target="_blank">Conditional Formatting</a> feature to alternate the background color for a table
                data region, which improves the readability of data.</li>
        </ul>
        <p>
            More information about handling images, text boxes, chart, and table report items can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>