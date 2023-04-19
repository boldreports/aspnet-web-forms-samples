﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.ReportWriter.ReportWriter" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <form class="r-w-form" id="reportform" method="post" action="api" enctype="application/x-www-form-urlencoded">
        <div class="r-w-container">
            <div class="r-w-sample-container">
                <div class="r-w-samples">
                    <div class="r-w-samples-portrait">
                        <div class="r-w-sample r-w-sample-portrait"
                            onclick="onSampleClick({event: event, name:'website-visitor-analysis'})">
                            <img class="r-w-sample-image" style="background-position-y: -2640px" />
                            <div class="r-w-sample-title">Website Visitor Analysis</div>
                        </div>
                        <div class="r-w-sample r-w-sample-portrait"
                            onclick="onSampleClick({event: event, name:'northwind-products-suppliers-report'})">
                            <img class="r-w-sample-image" style="background-position-y: -960px" />
                            <div class="r-w-sample-title">Northwind Products and Suppliers Report</div>
                        </div>
                        <div class="r-w-sample r-w-sample-portrait"
                            onclick="onSampleClick({event: event, name:'sales-report'})">
                            <img class="r-w-sample-image" style="background-position-y: 1200px" />
                            <div class="r-w-sample-title">Sales Report</div>
                        </div>
                    </div>
                    <div class="r-w-samples-landscape">
                        <div class="r-w-sample r-w-sample-landscape r-w-sample-active"
                            onclick="onSampleClick({event: event, name:'company-sales'})">
                            <img class="r-w-sample-image" style="background-position-y: -160px" />
                            <div class="r-w-sample-title">Company Sales</div>
                        </div>
                        <div class="r-w-sample r-w-sample-landscape"
                            onclick="onSampleClick({event: event, name:'sales-order-detail'})">
                            <img class="r-w-sample-image" style="background-position-y: -640px" />
                            <div class="r-w-sample-title">Sales Order Detail</div>
                        </div>
                        <div class="r-w-sample r-w-sample-landscape" style="visibility: hidden">
                        </div>
                    </div>
                </div>
        </div>
            <div class="r-w-property-container">
                <div class="r-w-property-title">Properties</div>
                <div class="r-w-property">
                    <div class="r-w-property-name">Save as</div>
                    <div class="r-w-property-value">
                        <select id="dropdown" name="type">
                            <option value="pdf">PDF</option>
                            <option value="word">Word</option>
                            <option value="excel">Excel</option>
                            <option value="csv">CSV</option>
                            <option value="html">HTML</option>
                            <option value="ppt">PowerPoint</option>
                            <option value="xml">XML</option>
                        </select>
                    </div>
                </div>
                <input type="text" style="display: none" name="reportName" />
                <input class="r-w-genearte e-button e-js e-ntouch e-btn-normal e-btn e-select e-widget"
                    onclick="onSubmitBtnClick()" type="submit" value="Generate" />
                <% if (!ReportsWebFormsSamples.Models.Globals.isPhatomJSExist)
                    { %>
                <div class="alert alert-warning alert-dismissible" role="alert">
                    Data Visualization report items will not be exported properly since <a href="https://phantomjs.org/" target="_blank">PhanthomJS</a> was not found in this application.
                   
                </div>
                <%}  %>
            </div>
        </div>
        <script>
            let reportNameInputele = document.querySelector('[name=reportName]');
            reportNameInputele.value = 'company-sales';
            function onSampleClick(args) {
                let prevEle = document.querySelector('.r-w-sample-active');
                if (prevEle) {
                    prevEle.classList.remove('r-w-sample-active');
                }
                args.event.currentTarget.classList.add('r-w-sample-active');
                reportNameInputele.value = args.name;
            }

            function onSubmitBtnClick() {
                let reportFormElement = document.getElementById('reportform');
                let reportType = document.getElementById("dropdown").value;
                reportFormElement.action = getBasePath() + 'api/ReportWriter/generate?reportName=' + reportNameInputele.value + '&type=' + reportType;
            }

            $(function () {
                $('#dropdown').ejDropDownList({
                    minPopupHeight: 190,
                    watermarkText: "  File Types",
                    selectedIndex: 0
                });
            });
        </script>
</asp:Content>

<asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

    <div id="description">
        <p>
            This demo allows you to <code>export</code> the Website Visitor Analysis, Northwind Products and Suppliers, Sales Report, Company Sales and Sales Order Detail Reports with popular file formats like PDF, HTML, Microsoft Word, and Microsoft Excel without previewing the report using our Report Viewer.
        </p>
        <p>
            It uses <a href="https://phantomjs.org/" target="_blank">PhantomJS</a> for exporting the reports in various file formats.
        </p>
        <p>
            More information about report writer can be found in this <a href="https://help.boldreports.com/embedded-reporting/aspnet-web-forms-reporting/report-writer/" target="_blank">documentation</a> section.
        </p>
    </div>

</asp:Content>
