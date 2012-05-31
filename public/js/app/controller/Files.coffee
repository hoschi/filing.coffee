Ext.define 'Filing.controller.Files',
    extend: 'Ext.app.Controller'
    stores: ['Files']
    models: ['File']
    views:['List', 'New']

    refs: [
            ref: 'list',
            selector: 'list'
    ]

    init: ->
        @control
            new:
                actioncomplete: @formActionComplete
            list:
                deleteFile: @deleteFile

    formActionComplete: (form, action) ->
        @getList().getStore().load()

    deleteFile: (rowIndex) ->
        console.debug 'controller delete'
        @getList().getStore().removeAt(rowIndex)
