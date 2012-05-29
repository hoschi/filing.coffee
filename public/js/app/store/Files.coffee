Ext.define 'Filing.store.Files',
    extend: 'Ext.data.Store'
    model: 'Filing.model.File'

    requires: [
        'Filing.data.proxy.Rest'
    ]

    autoLoad:true
    autoSync: true
    proxy:
        type: 'filing'
        url: '/files'
