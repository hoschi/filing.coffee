Ext.application
    name: 'filing',

    #appFolder: 'app',
    #autoCreateViewport: true,

    launch: ->
        Ext.create 'Ext.container.Viewport',
            layout: 'border',
            title: 'Your files',
            items: [{
                    region:'center',
                    html : 'List files here'
                }
            ]

