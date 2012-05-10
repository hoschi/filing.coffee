Ext.application
    name: 'Filing'

    # set up namespace for ext loader
    # this is not used because we use sprockets to manage dependencies and minify code for production use
    appFolder: 'js/app'

    # create app/view/Viewport.coffee
    autoCreateViewport: true

    controllers: ['Files']
