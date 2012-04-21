require('zappa') ->
    @use 'bodyParser', 'methodOverride', @app.router, 'static'

    @configure
        development: => @use errorHandler: {dumpExceptions: on}
        production: => @use 'errorHandler'

    @view layout: ->
        doctype 5
        html ->
            head ->
                title @title
                link rel:'stylesheet', href:'/js/ext/resources/css/ext-all.css'
                script src:"/js/ext/adapter/ext/ext-base.js"
                script src:"/js/ext/ext-all-debug.js"
            body @body

    @view index: ->
        p "test"

    @get '/': ->
        @render 'index', title: 'File me a coffee'


