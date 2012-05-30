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

    @app.files = @app.db.collection('files')

    # use http://coffeekup.org/
    @view layout: ->
        doctype 5
        html ->
            head ->
                title @title
                link rel:'stylesheet', href:'/js/ext/resources/css/ext-all.css'
                if process.env.NODE_ENV is 'production'
                    script src:'/js/ext/ext-all.js'
                else
                    script src:'/js/ext/ext-debug.js'
                script src:'/js/app/app.js'
            body @body

    @view index: ->
        '' # all other stuff should be handled by ext application

    @get '/': ->
        @render 'index', title: 'File me a coffee'

    #
    # files collection REST api
    #
    @get '/files': ->
        @app.files.find().toArray (err, data) =>
            @response.json
                data: data
                total: data.length

    # TODO fix this!
    @put '/files/:id': ->
        @app.files.update {id: @params.id}, {id: @body.id, title: @body.title}, {}, =>
            console.log "Saved file with id #{@body.id} and title #{@body.title}."
            @response.json @body


