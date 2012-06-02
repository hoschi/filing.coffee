# TODO add validation on client and server
# http://www.alsonkemp.com/geekery/extjs-4-models-node-js/
Ext.define 'Filing.model.File',
    extend: 'Ext.data.Model'

    requires: [
        'Filing.data.proxy.Rest'
    ]

    fields: ['_id', 'id', 'title']
    idProperty: '_id'

    proxy:
        type: 'filing'
        url: '/files'
