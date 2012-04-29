#= require List.coffee
Ext.define 'Filing.view.Viewport',
    extend: 'Ext.container.Viewport'
    layout: 'fit'

    initComponent: ->
        @items = [
            title:'Your files'
            layout:'fit'
            items :[
                layout: 'border'
                items: [
                    region:'north'
                    html:'add new file'
                    height:100
                ,
                    region:'center'
                    xtype:'list'
                ]
            ]
        ]
        @callParent arguments
