<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.GroupingAggregate.GroupingAggregate" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="grouping-aggregate.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            The Grouping Aggregate RDL report is designed with the <b>Grouping</b> and <b>Total</b> concept to organize
            and summarize the data using Tablix data region.
        </p>
        <p>
            It breaks the information down into quarterly intervals, so that you can analyze the information according
            to the order year.
        </p>
        <ul>
            <li><b>Row grouping</b> is used to group the data based on quarterly sale.</li>
            <li>Using the <code>Total</code> feature, the total sales amount for each quarter and year is calculated in
                Tablix data region.</li>
            <li>The sales value for each quarter is formatted in the <code>Currency </code> <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/format-data/"
                    target="_blank">format</a> to improve the readability of report.</li>
        </ul>
        <p>
            More information about the Tablix data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">documentation</a> section.
        </p>

    </div>

</asp:Content>