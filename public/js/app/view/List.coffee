Ext.define 'Filing.view.List',
    extend:'Ext.grid.Panel'
    alias:'widget.list'

    store:'Files'
    title:'Your files:'

    selType: 'cellmodel',
    plugins: [
        Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 1
        })
    ],

    initComponent: ->
        @columns = [
            header: 'ID'
            dataIndex: 'id'
            width: 25
        ,
            header: 'Title'
            dataIndex: 'title'
            flex:1
            editor: 'textfield'
        ]
        @callParent arguments
