<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs"
    Inherits="ReportsWebFormsSamples.Views.DataBar.DataBar" %>

    <%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

        <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

            <Bold:ReportViewer runat="server" ID="Reports" ReportPath="data-bar.rdl"
                ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
                OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick">
            </Bold:ReportViewer>
        </asp:Content>

        <asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

            <div id="description">
                <p>
                    Data bars convey lot of information in a little space, and are mostly used in tables and matrices. In this report, sales data are interpreted to visualize the sales figures in a tabular format.
                </p>
                <p>
                    More information about the Databar report item can be found in this <a
                        href="https://help.boldreports.com/embedded-reporting/react-reporting/report-designer/designer-guide/report-items/data-bar/"
                        target="_blank">documentation</a> section.
                </p>
            </div>

        </asp:Content>