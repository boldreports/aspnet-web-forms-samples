<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.Invoice.Invoice" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <Bold:ReportViewer runat="server" ID="Reports" ReportPath="invoice.rdl"
        ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
        OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"></Bold:ReportViewer>

</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            In this demo, invoice report is generated based on <a
                href="https://help.boldreports.com/on-premise/report-designer/report-parameters/add/"
                target="_blank">Report Parameters</a> at run time, and it displays the comprehensive overview of an
            invoice that indicates the shipping order details using parameters, <a
                href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                target="_blank">expressions</a>, and calculated fields with Tablix report item.
        </p>
        <ul>
            <li>Using <a
                    href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/#set-expression"
                    target="_blank">Expression
                </a> with text box report item, the report is designed to dynamically display the invoice details.</li>
            <li>
                Using the <code>Total</code> feature in table report item, the sum of product price is calculated.
            </li>
        </ul>
        <p>
            More information about the text box, expressions, and table data region can be found in this <a
                href="https://help.boldreports.com/on-premise/report-designer/compose-report/properties-panel/"
                target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>