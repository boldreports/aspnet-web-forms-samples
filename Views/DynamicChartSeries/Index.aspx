<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.DynamicChartSeries.DynamicChartSeries" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="dynamic-chart-series.rdl"
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
            This demo shows the VisitorsCount, PurchaserCount, AddedToCartCount by dynamically chossing the chart series.
        </p>
        <p>
            More information about the Chart report item can be found in this <a href="https://help.boldreports.com/enterprise-reporting/designer-guide/report-designer/report-items/chart/"
                                                                                  target="_blank">documentation</a> section.
        </p>
    </div>
</asp:Content>