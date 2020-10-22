<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.PatientExperienceAnalysis.PatientExperienceAnalysis" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="patient-experience-analysis.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            This report shows the Patient's satisfaction, average stay duration, count and average waiting time using <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/tablix/"
                target="_blank">Tablix</a> and <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/" target="_blank">Chart</a>
            report items.
        </p>
        <p>
            Patient experience analysis is widely used to evaluate the quality of healthcare centers. The analysis data of
            patient’s feedback about a healthcare unit is presented as a clear and precise report using data regions such as
            doughnut, line charts and table in our Report Viewer.
        </p>
        <p>
            More information about chart data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/report-items/chart/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>