mongoq = require 'mongoq'
bson = mongoq.BSON
ID = mongoq.BSON.ObjectID

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
                    script src:'/js/ext/ext-all-debug.js'
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
        @app.files.find()
            .sort('id', 'asc')
            .toArray (err, data) =>
                @response.json
                    data: data
                    total: data.length

    @post '/files': ->
        @app.files.insert
                id: new bson.Long @body.id
                title: @body.title
                createdAt: Date.parse @body.createdAt
                updatedAt: Date.parse @body.updatedAt
            ,
                safe:true
            .done (doc) =>
                console.log 'New file inserted'
                @response.json doc
            .fail (err) =>
                console.log 'An error occured during inserting new file'
                console.log err
                @response.json
                    success: false
                    errors:
                        msg: err

    @put '/files/:id': ->
        console.log @body.updatedAt
        @app.files.findAndModify(
                # find it
                _id: new ID @params.id
            ,
                # sort it
                {}
            ,
                # update it
                id: @body.id
                title: @body.title
                updatedAt: Date.parse @body.updatedAt
            ,
                # options
                new:true
                safe:true
            )
            # return it
            .done (doc) =>
                console.log "Saved file with id #{@params.id}."
                @response.json doc
            .fail (err) =>
                console.log 'An error occured during updating a file'
                console.log err
                @response.json
                    success: false
                    errors:
                        msg: err

    @get '/files/:id': ->
        @app.files.find({_id: new ID @params.id })
            .toArray (err, data) =>
                @response.json
                    data: data
                    total: data.length

    @del '/files/:id': ->
        @app.files.remove({_id: new ID @params.id })
            .done =>
                console.log "Removed file with id #{@params.id}."
                @response.json @body
            .fail (err) =>
                console.log 'An error occured during deleting a file'
                console.log err
                @response.json
                    success: false
                    errors:
                        msg: err

