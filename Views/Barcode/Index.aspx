<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.Barcode.Barcode" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="barcode.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            Custom Report Item allows you to add the functionality that is not natively supported in the RDL or extend the
            functionality of existing controls in the RDL standard.
        </p>
        <p>
            This report showcases the one-dimensional and two-dimensional barcode types rendered in our Report Viewer
            through Custom Report Item.
        </p>
        <p>
            More information about Barcode can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/barcode/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>