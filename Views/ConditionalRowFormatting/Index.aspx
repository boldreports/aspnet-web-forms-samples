<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.ConditionalRowFormatting.ConditionalRowFormatting" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="conditional-row-formatting.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            This demo illustrates the Conditional Formatting feature along with <a
                href="https://help.boldreports.com/on-premise/report-designer/report-parameters/add/"
                target="_blank">Report Parameters</a> using the Tablix data region. Based on the country name selected
            in the <code>Highlight Country</code>
            parameter, the available customer details of the respective country are highlighted using conditional
            formatting. It makes the report easier
            to read horizontally and enhances the look and feel of report.
        </p>
        <ul>
            <li><b>Conditional IIF Statement</b> is used to build <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">expression</a> for background color, thereby it highlights the rows based on the
                <code>Country Name</code> field.</li>
        </ul>
        <p>
            Conditional row formatting report designing steps can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/conditional-formatting-tablix-data-region/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>