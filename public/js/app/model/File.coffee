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
