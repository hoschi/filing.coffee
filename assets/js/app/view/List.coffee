#= require ../store/Files.coffee
Ext.define 'Filing.view.List',
    extend:'Ext.grid.Panel'
    alias:'widget.list'

    store:'Files'
    title:'Your files:'

    initComponent: ->
        @columns = [
            header: 'ID'
            dataIndex: 'id'
            flex:1
        ,
            header: 'Title'
            dataIndex: 'title'
            flex:1
        ]
        @callParent arguments
