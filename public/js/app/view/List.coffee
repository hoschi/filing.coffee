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
        @addEvents 'deleteFile'
        @columns = [
            sortable: false
            menuDisabled: true
            xtype: 'actioncolumn'
            width: 25
            items: [
                    icon: 'js/ext/examples/shared/icons/fam/delete.gif'
                    tooltip: 'Delete',
                    handler: (grid, rowIndex, colIndex) ->
                        console.debug 'fire delete', grid, grid.getId(), rowIndex
                        grid.ownerCt.fireEvent('deleteFile', rowIndex)
            ]
        ,
            header: 'ID'
            dataIndex: 'id'
            width: 35
            sortable: true
        ,
            header: 'Title'
            dataIndex: 'title'
            flex:1
            editor: 'textfield'
            sortable: true
        ,
            header: 'Updated'
            dataIndex: 'updatedAt'
            flex:1
            sortable: true
        ,
            header: 'Created'
            dataIndex: 'createdAt'
            hidden: true
            flex:1
            sortable: true
        ]
        @callParent arguments
