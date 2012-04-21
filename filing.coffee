require('zappa') ->
    @use 'bodyParser', 'methodOverride', @app.router, static: "#{__dirname}/public"

    @configure
        development: => @use errorHandler: {dumpExceptions: on}
        production: => @use 'errorHandler'

    # use http://coffeekup.org/
    @view layout: ->
        doctype 5
        html ->
            head ->
                title @title
                link rel:'stylesheet', href:'/js/ext/resources/css/ext-all.css'
                script src:'/js/ext/adapter/ext/ext-base.js'
                script src:'/js/ext/ext-all-debug.js'
                script src: '/js/app.js'
            body @body

    @view index: ->
        p "You should see some ext code here, damn!"

    @get '/': ->
        @render 'index', title: 'File me a coffee'


