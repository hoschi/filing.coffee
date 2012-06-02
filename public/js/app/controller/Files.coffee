Ext.define 'Filing.controller.Files',
    extend: 'Ext.app.Controller'
    stores: ['Files']
    models: ['File']
    views:['List', 'New']

    refs: [
            ref: 'list',
            selector: 'list'
        ,
            ref: 'new'
            selector: 'new'
        ,
            ref: 'addIdField'
            selector: 'new numberfield[name="id"]'
    ]

    # Last ID of file added by this interface
    # @private
    lastId: null

    init: ->
        @control
            new:
                beforerender:
                    fn: @createNewFile
                    scope: this
                    single: true
            'new > field':
                specialkey: @onNewFormFieldEnterPress
            'new button':
                click: @submitNewFile
            list:
                deleteFile: @onDeleteFile

    #####################################
    # methods
    #####################################

    getForm: () ->
        @getNew().getForm()

    # create a new file instance for the 'new' widget
    createNewFile: () ->
        one = Ext.create 'Filing.model.File'
        if @lastId isnt null
            one.set 'id', ++@lastId

        console.debug 'load fresh file into "new file" form', one
        @getForm().loadRecord one
        if @lastId is null
            @getAddIdField().setValue ''

        # remove ugly red underline
        @getForm().clearInvalid()

    # save record from 'new' widget to the server
    submitNewFile: () ->
        if @getForm().isValid() is true
            record = @getForm().getRecord()
            @getForm().updateRecord record

            if record.validate() is false
                Ext.Msg.alert("Model instance isn't valid!")

            record.save
                    success: (record) =>
                        console.info('Success', record)
                        @lastId = record.get 'id'
                        @createNewFile()
                        @updateList()
                ,
                    failure: (record) ->
                        Ext.Msg.alert('Failed', record)

    # update 'list' widgets store from server
    updateList: () ->
        @getList().getStore().load()

    #####################################
    # event handlers
    #####################################

    onDeleteFile: (rowIndex) ->
        console.debug 'controller delete'
        @getList().getStore().removeAt(rowIndex)

    onNewFormFieldEnterPress: (field, e, eOpts) ->
        if e.getKey() is e.ENTER
            console.debug 'controller try to send form'
            @submitNewFile()

