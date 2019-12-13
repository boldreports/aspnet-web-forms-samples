<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.Designer.Designer" %>

<%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <Bold:ReportDesigner ID="designer" runat="server" OnClientAjaxBeforeLoad="onAjaxBeforeLoad" ServiceUrl='<%# Globals.DESIGNER_SERVICE_URL %>' OnClientCreate="controlCreate" OnClientToolbarRendering="toolbarRendering" OnClientToolbarClick="toolbarClick"></Bold:ReportDesigner>


    <script>
        let designerInst;
        function controlCreate() {
            designerInst = $(<%=designer.ClientID%>).data('boldReportDesigner');
            let reportName = getReportName();
            designerInst.setModel({
                previewOptions: {
                    exportItemClick: "onExportItemClick"
                }
            });
            if (reportName) {
                designerInst.openReport(reportName);
            }
        }

        function onAjaxBeforeLoad(args) {
            args.data = JSON.stringify({ reportType: "RDL" });
        }

        function toolbarRendering(args) {
            if ($(args.target).hasClass('e-rptdesigner-toolbarcontainer')) {
                var saveButton = ej.buildTag('li.e-rptdesigner-toolbarli e-designer-toolbar-align e-tooltxt', '', {}, {});
                var saveIcon = ej.buildTag('span.e-rptdesigner-toolbar-icon e-toolbarfonticonbasic e-rptdesigner-toolbar-save e-li-item', '', {}, { title: 'Save' });
                args.target.find('ul:first').append(saveButton.append(saveIcon));
            }
        }

        function toolbarClick(args) {
            if (args.click === 'Save') {
                args.cancel = true;
                designerInst.saveToDevice();
            }
        }

        function getReportName() {
            const reportNameRegex = /[\\?&]report-name=([^&#]*)/.exec(location.search);
            return reportNameRegex ? reportNameRegex[1] : undefined;
        };
    </script>
</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            The Syncfusion Enterprise BI Reporting is an end-to-end solution for creating, managing and sharing interactive
            business reports.
        </p>
        <p>
            It includes a powerful report designer for easily composing open <code>Report Definition Language (RDL)</code>
            specification reports as well as a web interface for managing and sharing reports.
        </p>
    </div>

</asp:Content>
