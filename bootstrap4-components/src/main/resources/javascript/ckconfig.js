CKEDITOR.stylesSet.add('text', [
    {name: 'Heading 1', element: 'h1'},
    {name: 'Heading 2', element: 'h2'},
    {name: 'Heading 3', element: 'h3'},
    {name: 'Heading 4', element: 'h4'},
    {name: 'Heading 5', element: 'h5'},
    {name: 'Heading 6', element: 'h6'},

    {name: 'Lead', element: 'p', attributes: {class: 'lead'}},
    {name: 'Highlight text', element: 'marl'},
    {name: 'Deleted text', element: 'del'},
    {name: 'No longer accurate', element: 's'},
    {name: 'Addition to the document', element: 'ins'},
    {name: 'Underlined', element: 'u'},
    {name: 'Fine print', element: 'small'},
    {name: 'Bold text', element: 'strong'},
    {name: 'Italicized text', element: 'em'},
    {name: 'Code', element: 'code'},
    {name: 'Blockquotes', element: 'blockquote', attributes: {class: 'blockquote'}},
    {name: 'Blockquotes Reverse', element: 'blockquote', attributes: {class: 'blockquote blockquote-reverse'}},
    {name: 'Variables', element: 'var'},
    {name: 'User input', element: 'kbd'},
    {name: 'Sample output', element: 'samp'},

    {name: 'Text Muted', element: 'p', attributes: {class: 'text-muted'}},
    {name: 'Text Primary', element: 'p', attributes: {class: 'text-primary'}},
    {name: 'Text Success', element: 'p', attributes: {class: 'text-success'}},
    {name: 'Text Info', element: 'p', attributes: {class: 'text-info'}},
    {name: 'Text Warning', element: 'p', attributes: {class: 'text-warning'}},
    {name: 'Text Danger', element: 'p', attributes: {class: 'text-danger'}},

    {name: 'Background Primary', element: 'div', attributes: {class: 'bg-primary text-white'}},
    {name: 'Background Success', element: 'div', attributes: {class: 'bg-success text-white'}},
    {name: 'Background Info', element: 'div', attributes: {class: 'bg-info text-white'}},
    {name: 'Background Warning', element: 'div', attributes: {class: 'bg-warning text-white'}},
    {name: 'Background Danger', element: 'div', attributes: {class: 'bg-dange text-whiter'}},
    {name: 'Background Inverse', element: 'div', attributes: {class: 'bg-inverse text-white'}},
    {name: 'Background Faded', element: 'div', attributes: {class: 'bg-faded text-white'}},

    {name: 'Display 1', element: 'h1', attributes: {class: 'display-1'}},
    {name: 'Display 2', element: 'h2', attributes: {class: 'display-2'}},
    {name: 'Display 3', element: 'h3', attributes: {class: 'display-3'}},
    {name: 'Display 4', element: 'h4', attributes: {class: 'display-4'}},


    {name: 'Alert Success', element: 'div', attributes: {class: 'alert alert-success', role: 'alert'}},
    {name: 'Alert Information', element: 'div', attributes: {class: 'alert alert-info', role: 'alert'}},
    {name: 'Alert Warning', element: 'div', attributes: {class: 'alert alert-warning', role: 'alert'}},
    {name: 'Alert Danger', element: 'div', attributes: {class: 'alert alert-danger', role: 'alert'}},

    {name: 'Badge Default', element: 'span', attributes: {class: 'badge badge-default'}},
    {name: 'Badge Primary', element: 'span', attributes: {class: 'badge badge-primary'}},
    {name: 'Badge Success', element: 'span', attributes: {class: 'badge badge-success'}},
    {name: 'Badge Info', element: 'span', attributes: {class: 'badge badge-info'}},
    {name: 'Badge Warning', element: 'span', attributes: {class: 'badge badge-warning'}},
    {name: 'Badge Danger', element: 'span', attributes: {class: 'badge badge-danger'}},

    {name: 'Pill Default', element: 'span', attributes: {class: 'badge badge-pill badge-default'}},
    {name: 'Pill Primary', element: 'span', attributes: {class: 'badge badge-pill badge-primary'}},
    {name: 'Pill Success', element: 'span', attributes: {class: 'badge badge-pill badge-success'}},
    {name: 'Pill Info', element: 'span', attributes: {class: 'badge badge-pill badge-info'}},
    {name: 'Pill Warning', element: 'span', attributes: {class: 'badge badge-pill badge-warning'}},
    {name: 'Pill Danger', element: 'span', attributes: {class: 'badge badge-pill badge-danger'}},

    {name: 'Label Default', element: 'span', attributes: {class: 'label'}},
    {name: 'Label Success', element: 'span', attributes: {class: 'label label-success'}},
    {name: 'Label Warning', element: 'span', attributes: {class: 'label label-warning'}},
    {name: 'Label Important', element: 'span', attributes: {class: 'label label-important'}},
    {name: 'Label Info', element: 'span', attributes: {class: 'label label-info'}},
    {name: 'Label Inverse', element: 'span', attributes: {class: 'label label-inverse'}},

    {name: 'Well Default', element: 'div', attributes: {class: 'well'}},
    {name: 'Well White', element: 'div', attributes: {class: 'well well-white'}},


    {name: 'Pre', element: 'pre', attributes: {class: 'prettyprint linenums'}}
]);

CKEDITOR.editorConfig = function (config) {
    config.allowedContent = true;

    config.contextPath = (typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '';
    config.language = (typeof contextJsParameters != 'undefined') ? contextJsParameters.uilang : 'en';
    config.contentlanguage = (typeof contextJsParameters != 'undefined') ? contextJsParameters.lang : 'en';
    config.siteUuid = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteUuid : '';

    config.filebrowserWindowFeatures = 'location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes';
    config.filebrowserWindowName = 'JahiaFileBrowser';
    config.filebrowserBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserImageBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=imagepicker&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserFlashBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?mime=application%2Fx-shockwave-flash%2Cvideo%2Fx-flv&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserLinkBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=editoriallinkpicker&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.image_previewText = '';

    config.toolbar = 'Tinny';
    config.stylesSet = 'text';
    config.contentsCss = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap4-core/css/bootstrap.min.css' ];
    config.templates_files = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap4-components/javascript/cktemplates.js' ];


    config.toolbar_Tinny = [
        ['Source', '-', 'Templates', 'PasteText', 'wsc','Scayt', 'ACheck', 'SpellChecker','Styles'],
        ['Bold','Italic'],
        ['NumberedList', 'BulletedList', 'Outdent','Indent', 'Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight'],
        ['Link', 'Unlink','Anchor','Image'],
        ['RemoveFormat','HorizontalRule','ShowBlocks']
    ];

    config.extraPlugins = 'acheck,wsc,scayt,macrosdropdown';
    config.templates_replaceContent = false;

    // [ Left, Center, Right, Justified ]
    config.justifyClasses = [ 'text-left', 'text-center', 'text-right', 'text-justify' ];
};

CKEDITOR.addCss(
    '.cke_combopanel { width:300px !important;}'
)

CKEDITOR.dtd.$removeEmpty['i'] = 0;
CKEDITOR.dtd.$removeEmpty['span'] = 0;

CKEDITOR.on('instanceReady', function() {
    $(".cke_combo_inlinelabel").text("Inline styles");
});