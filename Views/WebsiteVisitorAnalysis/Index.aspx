<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.WebsiteVisitorAnalysis.WebsiteVisitorAnalysis" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<Bold:ReportViewer runat="server" ID="Reports" ReportPath="website-visitor-analysis.rdl" ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering" OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

       <div id="description">
        <p>
            In a digital marketing environment, website visitor analysis is one of the key factors to analyze and monitor how visitors are referred to a page, how long they spend in a page, and where they go next.
        </p>
        <p>
            In this demo, such data of a fictitious e-commerce website are illustrated using often used data regions such as pie, column, and smooth line charts and table in Bold Reports Report Viewer.  
        </p>
        <p>
            More information about chart data region can be found in this <a
            href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/"
            target="_blank">documentation</a> section.
        </p>    
    </div>

</asp:Content>