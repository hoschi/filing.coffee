# require stuff here to tell assets that he has to watch these files for changes
#= require_tree controller
#= require_tree model
#= require_tree store
#= require_tree view
Ext.application
    name: 'Filing'

    # set up namespace for ext loader
    # this is not used because we use sprockets to manage dependencies and minify code for production use
    #appFolder: 'js/app'

    # create app/view/Viewport.coffee
    autoCreateViewport: true

    controllers: ['Files']
