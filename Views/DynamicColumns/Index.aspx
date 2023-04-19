<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.DynamicColumns.DynamicColumns" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<Bold:ReportViewer runat="server" ID="Reports" ReportPath="dynamic-columns.rdl" ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering" OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            Dynamic column tabular report demonstrates to change the number of columns at runtime using JavaScript Bold Report Viewer.
        </p>
        <ul>
            <li>
               Dynamic column is a feature that allows one to store different sets of columns for each row in a table.
            <li>
                In this table few columns are static and few can be varied, based on the column names selected in the parameter. This feature is achieved by changing the column visibility based on the parameter selected.
            </li>
        </ul>
        <p>
            More information about the Tablix data region can be found in this <a href="https://help.boldreports.com/enterprise-reporting/designer-guide/report-designer/report-items/tablix/"
                                                                                  target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>