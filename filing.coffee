assets = require 'connect-assets'
mongoq = require 'mongoq'
require('zappa') ->

    @configure
        development: =>
            @use errorHandler: {dumpExceptions: on}
            @app.db = mongoq('mongodb://localhost/filing-dev')
            console.log('** developing mode **')
        production: =>
            @use 'errorHandler'
            @app.db = mongoq('mongodb://localhost/filing')
            console.log('** production mode **')

    # zappa configuration
    @use 'bodyParser', 'methodOverride', @app.router, static: "#{__dirname}/public"
    @use assets()


    @app.files = @app.db.collection('files')

    # use http://coffeekup.org/
    @view layout: ->
        doctype 5
        html ->
            head ->
                title @title
                link rel:'stylesheet', href:'/ext/resources/css/ext-all.css'
                script src:'/ext/ext-debug.js'
                js('app')
            body @body

    @view index: ->
        p "You should see some ext code here, damn!"

    @get '/': ->
        @render 'index', title: 'File me a coffee'

    @get '/files': ->
        @app.files.find().toArray (err, data) =>
            @response.json
                data: data
                total: data.length




