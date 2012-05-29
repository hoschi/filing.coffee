Ext.define 'Filing.data.proxy.Rest',
    extend: 'Ext.data.proxy.Rest'
    alias: 'proxy.filing'

    requires: ['Filing.data.reader.Json']

    reader:
        type: 'filing'
