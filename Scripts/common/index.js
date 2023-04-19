﻿(function onInit() {
    document.querySelector('.mobile-overlay').classList.add('e-hidden');
    let urlPaths = location.pathname.replace(getBasePath(), '').split('/');
    reportBasePath = urlPaths[0];
    reportRouterPath = urlPaths[1] ? urlPaths[1] : '';
    reportSamples = getReportSampleData().samples;
    bannerData = getReportSampleData().banner;
    reportSampleData = reportSamples.filter(function (sample) {
        return (sample.routerPath === reportRouterPath && sample.basePath === reportBasePath)
    })[0];
    document.querySelector(".splash").classList.add('e-hidden');
    document.querySelector('.ej-body.e-hidden').classList.remove('e-hidden');
    tocSelection();
    updateSampleDetails();
    loadTabContent();
    setReportsHeight();
    updateTab();
    $('a[data-toggle="tab"][href="#demo"]').on('shown.bs.tab', resizeReportViewer);
})();

window.addEventListener('resize', function () {
    setReportsHeight();
    updateTab();
    updateOverlay();
});

function tocSelection() {
    let ele = document.querySelectorAll('.ej-sb-toc-card')[reportSamples.indexOf(reportSampleData)];
    let previousSelected = document.querySelector('.toc-selected');
    if (previousSelected) {
        previousSelected.classList.remove('toc-selected')
    }
    ele.classList.add('toc-selected');
    ele.focus();
}

function loadTabContent() {
    $('#parentTab li:first-child a').tab('show');
    $('#childtTab li:first-child a').tab('show');
    let sampleName = reportRouterPath ? reportRouterPath : reportBasePath;
    let childaTab = document.getElementById("childTabContainer");
    let cshtml = getResponse(getBasePath() + 'Views/' + sampleName + '/Index.aspx?sourceTab=true');
    cshtml = new RegExp("<asp:Content[^>]*ContentPlaceHolderID[\\s]?=[\\s]?['\"]MainContent['\"][\\s\\S]*?<\/asp:Content>").exec(cshtml)[0];
    let csharp = getResponse(getBasePath() + 'Views/' + sampleName + '/Index.aspx.cs');
    childaTab.getElementsByClassName('cshtml-header')[0].textContent = 'Index.aspx';
    childaTab.getElementsByClassName('csharp-header')[0].textContent = 'Index.aspx.cs';
    childaTab.getElementsByClassName('cshtml-content')[0].innerHTML = Prism.highlight(cshtml, Prism.languages.csharp);
    childaTab.getElementsByClassName('csharp-content')[0].innerHTML = Prism.highlight(csharp, Prism.languages.csharp);
}

function setInnerText(selector, text) {
    document.querySelector(selector).innerText = text;
}

function updateSampleDetails() {
    setInnerText('.ej-main-body-content .ej-title', reportSampleData.sampleName);
    setInnerText('.ej-main-body-content .ej-meta-description', reportSampleData.metaData.description);

    //Banner
    setInnerText('.ej-main-body-content .ad-header', bannerData.text);
    setInnerText('.ej-main-body-content .cnt-text-1', bannerData.features[0]);
    setInnerText('.ej-main-body-content .cnt-text-2', bannerData.features[1]);
    setInnerText('.ej-main-body-content .cnt-text-3', bannerData.features[2]);
    document.querySelector('.free-trial-url').setAttribute('href', bannerData.freeTrialUrl);

}

function setReportsHeight() {
    let style = document.getElementById('reports-style');
    if (!style) {
        style = document.createElement('style');
        style.id = 'reports-style';
        document.body.appendChild(style);
    }
    style.textContent = `ej-sample{
        display: flex;
        overflow: hidden;
        min-height: 600px;
      }
      
      #MainContent_Reports{
        height: auto !important;
        width: 100% !important;
      }`;
}

function updateOverlay() {
    let mobileOverlay = document.querySelector('.mobile-overlay');
    let mobileSideBar = document.querySelector('ej-sidebar');
    if (!window.matchMedia('(max-width:550px)').matches) {
        mobileSideBar.classList.remove('ej-toc-mobile-slide-left');
        mobileOverlay.classList.add('e-hidden');
    }
}

function updateTab() {
    let sourceTab = document.querySelector('.ej-nav-item.source-tab');
    // let descTab = document.querySelector('.ej-nav-item.desc-tab');
    if (window.matchMedia('(max-width:850px)').matches) {
        $('#parentTab li:first-child a').tab('show');
        sourceTab.classList.add('e-hidden');
        // descTab.classList.add('e-hidden');
    } else {
        if (sourceTab.classList.contains('e-hidden')) {
            sourceTab.classList.remove('e-hidden');
            // descTab.classList.remove('e-hidden');
        }
    }
}

function getResponse(url) {
    return $.ajax({
        type: "GET",
        url: url,
        async: false
    }).responseText;
}

function resizeReportViewer() {
    let reportViewerElement = document.querySelector('.e-reportviewer.e-js');
    if (reportViewerElement) $(reportViewerElement).trigger('resize');
}