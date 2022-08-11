<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs"
    Inherits="ReportsWebFormsSamples.Views.ExternalParameterReport.ExternalParameterReport" %>
    <%@ Register Assembly="BoldReports.WebForms" Namespace="BoldReports.WebForms" TagPrefix="Bold" %>
        <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

            <div class="r-w-container">
                <div class="r-w-sample-container" id="r-w-sample-container">
                    <ej-sample>
                        <Bold:ReportViewer runat="server" ID="Reports" ReportPath="product-line-sales.rdl"
                            ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering"
                            OnClientToolBarItemClick="onToolBarItemClick" OnClientExportItemClick="onExportItemClick"
                            EnableParameterBlockScroller="false">
                        </Bold:ReportViewer>
                    </ej-sample>
                </div>
                <div class="r-w-property-container">
                    <div class="r-w-property-title">Parameters</div>
                    <div class="r-w-property">
                        <div class="r-w-property-name" id="r-w-property-name-category"> Category</div>
                        <div class="r-w-property-value">
                            <input type="text" id="category" />
                        </div>
                    </div>
                    <div class="r-w-property" id="r-w-property-subcategory">
                        <div class="r-w-property-name" id="r-w-property-name-subcategory">
                            Sub Category
                        </div>
                        <div class="r-w-property-value" id="r-w-property-value-subcategory">
                            <input type="text" id="subcategory" />
                        </div>
                    </div>
                    <div class="r-w-property" id="r-w-property-startdate">
                        <div class="r-w-property-name" id="r-w-property-name-startdate">
                            Start Date
                        </div>
                        <div class="r-w-property-value" id="r-w-property-value-startdate">
                            <input id="startdate" />
                        </div>
                    </div>
                    <div class="r-w-property" id="r-w-property-enddate">
                        <div class="r-w-property-name" id="r-w-property-name-enddate">
                            End Date
                        </div>
                        <div class="r-w-property-value">
                            <input id="enddate" />
                        </div>
                    </div>
                    <input type="button" id="update"
                        class="r-w-genearte e-button e-js e-ntouch e-btn-normal e-btn e-select e-widget"
                        value="View Report" />
                </div>
            </div>

            <script>
                var userAgent = window.navigator.userAgent;
                var isMobile = /mobile/i.test(userAgent);
                var wheelEvent = 'onwheel' in document.createElement('div') ? 'wheel' : 'mousewheel';
                if (wheelEvent && !isMobile) {
                    window.addEventListener(wheelEvent, function () { }, { passive: false });
                }
                var flag;
                $(function () {
                    var productSubCategoryList =<%= ReportsWebFormsSamples.Models.SqlQuery.getProductSubCategory() %>;
                    var productCategoryList =<%= ReportsWebFormsSamples.Models.SqlQuery.getProductCategory() %>;
                    $("#startdate").ejDatePicker({ value: new Date("1/1/2003"), width: "180px" });
                    $("#enddate").ejDatePicker({ value: new Date("12/31/2003"), width: "180px" });
                    var subCategoryDropDownList = productSubCategoryList.filter(({ ProductCategoryID }) => ProductCategoryID == 1);
                    $('#category').ejDropDownList({
                        dataSource: productCategoryList,
                        fields: {
                            text: "Name",
                            value: "ProductCategoryID",
                        },
                        selectedIndex: 1,
                        width: "180px",
                        change: function (args) {
                            $("#checkall").ejCheckBox({ checked: false });
                            var categoryID = $('#category').ejDropDownList("getSelectedValue");
                            var categoryDropDownList = productSubCategoryList.filter(({ ProductCategoryID }) => ProductCategoryID == categoryID);
                            var subCategoryObj = $('#subcategory').data("ejDropDownList");
                            subCategoryObj.option("dataSource", categoryDropDownList);
                        }
                    });
                    $('#subcategory').ejDropDownList({
                        dataSource: subCategoryDropDownList,
                        fields: {
                            text: "Name",
                            value: "ProductSubcategoryID",
                        },
                        showCheckbox: true,
                        change: "dropDownCheckAll",
                        headerTemplate: "<div id='checkall_wrap' ><input id ='checkall' type='checkbox'/></div>",
                        width: "180px",
                        selectedIndex: 1,
                        watermarkText: "Select Option"
                    });
                    $("#checkall").ejCheckBox({ text: "Select All", change: "selectAllSubCategory" });
                    $("#update").on("click", function () {
                        var reportViewer = $("#MainContent_Reports").boldReportViewer("instance");
                        var productCategory = $("#category").val();
                        var productSubcategory = ($('#subcategory').val()).split(",");
                        var startDate = $("#startdate").val();
                        var endDate = $("#enddate").val();
                        var parameters = [{ name: 'ProductCategory', labels: [productCategory], values: [productCategory] }, { name: 'ProductSubcategory', labels: productSubcategory, values: productSubcategory }, { name: 'StartDate', labels: [startDate], values: [startDate] }, { name: 'EndDate', labels: [endDate], values: [endDate] }];
                        reportViewer.model.parameters = parameters;
                        reportViewer.reload();
                    });
                })
                function selectAllSubCategory(args) {
                    if (!flag) {
                        var subCategoryObj = $("#subcategory").ejDropDownList("instance");
                        if (args.isChecked) subCategoryObj.checkAll();
                        else subCategoryObj.uncheckAll();
                    }
                }
                function dropDownCheckAll(args) {
                    var subCategoryObj = $("#subcategory").ejDropDownList("instance");
                    var instance = $("#checkall").data("ejCheckBox");
                    if (!args.isChecked) {
                        flag = true;
                        instance.setModel({ checked: false });
                        flag = false;
                    }
                    if (subCategoryObj.getSelectedItem().length == subCategoryObj.getListData().length) {
                        $("#checkall").ejCheckBox({ checked: true });
                    }
                }
            </script>
        </asp:Content>

        <asp:Content ID="descriptionContent" ContentPlaceHolderID="description" runat="server">

            <div id="description">
                <p>
                    The Product Line Sales RDL report represents the best performing sales people and stores using <a
                        href="https://help.boldreports.com/embedded-reporting/aspnet-web-forms-reporting/report-designer/designer-guide/report-items/tablix/"
                        target="_blank">Tablix</a> and <a
                        href="https://help.boldreports.com/embedded-reporting/aspnet-web-forms-reporting/report-designer/designer-guide/report-items/chart/"
                        target="_blank">Chart</a>
                    report items.
                </p>
                <ul>
                    <li>
                        The sales details are organized by category and sub-category of products using the concept of
                        external report parameters which is designed using <a
                            href="https://help.syncfusion.com/api/js/ejdropdownlist" target="_blank">ejdropdownlist</a>.
                        It allows users to filter Sub Category based on the selected Category.
                    </li>
                    <li>Non cascading parameters namely start date and end date also used in this report.</li>
                </ul>
                <p>
                    More information about handling the report items can be found in this <a
                        href="https://help.boldreports.com/embedded-reporting/aspnet-web-forms-reporting/report-designer/designer-guide/report-items/"
                        target="_blank">documentation</a> section.
                </p>
            </div>
        </asp:Content>