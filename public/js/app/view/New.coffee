Ext.define 'Filing.view.New',
    extend: 'Ext.form.Panel'
    alias: 'widget.new'

    # TODO this doesn't work
    url: 'addFile'

    title: 'Add a file'
    bodyPadding: 5

    defaults:
        anchor: '100%'

    defaultType: 'textfield'

    items: [
            fieldLabel: 'ID'
            name: 'id'
            allowBlank: false
        ,
            fieldLabel: 'Title'
            name: 'title'
            allowBlank: false
    ]

    buttons: [
        text:'Add this'
        formBind: true
        disabled: true
        handler: ->
            form = this.up('form').getForm()
            form.url = 'addFile'

            if form.isValid() is true
                form.submit
                        success: (form, action) ->
                            console.info('Success', action.result.msg)
                    ,
                        failure: (form, action) ->
                            Ext.Msg.alert('Failed', action.result.msg)
    ]
