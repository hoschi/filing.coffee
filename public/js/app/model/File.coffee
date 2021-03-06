# TODO add validation on client and server
# http://www.alsonkemp.com/geekery/extjs-4-models-node-js/
Ext.define 'Filing.model.File',
    extend: 'Ext.data.Model'

    requires: [
        'Filing.data.proxy.Rest'
    ]

    fields: [
            name:'_id'
            type:'string'
        ,
            name:'id'
            type:'int'
        ,
            name:'title'
            type:'string'
        ,
            name:'createdAt'
            type:'date'
            dateFormat: 'time'
        ,
            name:'updatedAt'
            type:'date'
            dateFormat: 'time'
    ]

    validations: [
            type:'presence',
            field:'title'
        ,
            type:'presence',
            field:'id'
        ,
    ]
    idProperty: '_id'

    proxy:
        type: 'filing'
        url: '/files'

    set: (fieldName, newValue) ->
        # set updated field to now
        if fieldName isnt 'updatedAt'
            @set 'updatedAt', new Date()
            console.log "set updated time to now, because field '#{fieldName}' was updated with '#{newValue}'."
        @callParent(arguments)

