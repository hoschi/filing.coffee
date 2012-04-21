Ext.application
    name: 'AM',

    appFolder: 'app',

    launch: ->
        Ext.create 'Ext.container.Viewport',
            layout: 'fit',
            items: [                {
                    xtype: 'panel',
                    title: 'Your files',
                    html : 'List your files here'
                }
            ]

