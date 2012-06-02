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
    ]

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

    createNewFile: () ->
        one = Ext.create 'Filing.model.File'
        console.debug 'load fresh file into "new file" form', one
        @getForm().loadRecord one

    submitNewFile: () ->
        if @getForm().isValid() is true
            record = @getForm().getRecord()
            @getForm().updateRecord record
            record.save
                    success: (record) =>
                        console.info('Success', record)
                        @createNewFile()
                        @updateList()
                ,
                    failure: (record) ->
                        Ext.Msg.alert('Failed', record)
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

