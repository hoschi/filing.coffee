Ext.define 'Filing.view.New',
    extend: 'Ext.form.Panel'
    alias: 'widget.new'

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
    ]
