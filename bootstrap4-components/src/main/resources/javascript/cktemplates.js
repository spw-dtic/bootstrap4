CKEDITOR.addTemplates('default',
    {
        // The name of the subfolder that contains the preview images of the templates.
        imagesPath:((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap3-components/img/',
        // Template definitions.
        templates:[
            {
                title:'Code blocks',
                image:'',
                description:'',
                html:'<pre><code>&lt;p&gt;Sample text here...&lt;/p&gt;\n&lt;p&gt;And another line of sample text here...&lt;/p&gt;</code></pre>'
            },
            {
                title:'',
                image:'alert_default.png',
                description:'',
                html:'<div class="alert">' +
                '<button type="button" class="close" data-dismiss="alert">×</button>' +
                '<strong>Warning!</strong> Best check yo self, you\'re not looking too good.' +
                '</div>'
            },
            {
                title:'',
                image:'alert_error.png',
                description:'',
                html:'<div class="alert alert-error">' +
                '<button type="button" class="close" data-dismiss="alert">×</button>' +
                '<strong>Oh snap!</strong> Change a few things up and try submitting again.' +
                '</div>'
            },
            {
                title:'',
                image:'alert_success.png',
                description:'',
                html:'<div class="alert alert-success">' +
                '<button type="button" class="close" data-dismiss="alert">×</button>' +
                '<strong>Well done!</strong> You successfully read this important alert message.' +
                '</div>'
            },
            {
                title:'',
                image:'alert_info.png',
                description:'',
                html:'<div class="alert alert-info">' +
                '<button type="button" class="close" data-dismiss="alert">×</button>' +
                '<strong>Heads up!</strong> This alert needs your attention, but it\'s not super important.' +
                '</div>'
            },
            {
                title:'',
                image:'well.png',
                description:'',
                html:'<div class="well">' +
                'Look, I\'m in a well!' +
                '</div>'
            },
            {
                title:'',
                image:'btn.png',
                description:'',
                html:'<a href="#" class="btn btn-default">' +
                'Standard button' +
                '</a>'
            },
            {
                title:'',
                image:'btn-primary.png',
                description:'',
                html:'<a href="#" class="btn btn-primary">' +
                'Primary button' +
                '</a>'
            },
            {
                title:'',
                image:'btn-info.png',
                description:'',
                html:'<a href="#" class="btn btn-info">' +
                'Info button' +
                '</a>'
            },
            {
                title:'',
                image:'btn-success.png',
                description:'',
                html:'<a href="#" class="btn btn-success">' +
                'Success button' +
                '</a>'
            },
            {
                title:'',
                image:'btn-warning.png',
                description:'',
                html:'<a href="#" class="btn btn-warning">' +
                'Warning button' +
                '</a>'
            },
            {
                title:'',
                image:'btn-danger.png',
                description:'',
                html:'<a href="#" class="btn btn-danger">' +
                'Danger button' +
                '</a>'
            },
            {
                title:'',
                image:'btn-inverse.png',
                description:'',
                html:'<a href="#" class="btn btn-inverse">' +
                'Inverse button' +
                '</a>'
            },
            {
                title:'',
                image:'table.png',
                description:'',
                html:'<table class="table"><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Username</th></tr></thead><tbody><tr><th scope="row">1</th><td>Mark</td><td>Otto</td><td>@mdo</td></tr><tr><th scope="row">2</th><td>Jacob</td><td>Thornton</td><td>@fat</td></tr><tr><th scope="row">3</th><td>Larry</td><td>the Bird</td><td>@twitter</td></tr></tbody></table>'
            },
            {
                title:'',
                image:'definition.png',
                description:'',
                html:'<dl class="row"><dt class="col-sm-3">Description lists</dt><dd class="col-sm-9">A description list is perfect for defining terms.</dd><dt class="col-sm-3">Euismod</dt><dd class="col-sm-9">Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd><dd class="col-sm-9 offset-sm-3">Donec id elit non mi porta gravida at eget metus.</dd><dt class="col-sm-3">Malesuada porta</dt><dd class="col-sm-9">Etiam porta sem malesuada magna mollis euismod.</dd><dt class="col-sm-3 text-truncate">Truncated term is truncated</dt><dd class="col-sm-9">Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd></dl>'
            },
            {
                title:'',
                image:'blockquote.png',
                description:'',
                html:'<blockquote class="blockquote"><p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p><footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer></blockquote>'
            },
            {
                title:'',
                image:'blockquote-right.png',
                description:'',
                html:'<blockquote class="blockquote blockquote-reverse"><p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p><footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer></blockquote>'

            }
        ]
    });
