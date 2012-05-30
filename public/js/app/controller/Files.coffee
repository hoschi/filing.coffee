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

    formActionComplete: (form, action) ->
        @getList().store.load()
