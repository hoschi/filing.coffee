// Generated by CoffeeScript 1.3.1
(function() {

  Ext.define('Filing.view.List', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.list',
    store: 'Files',
    title: 'Your files:',
    initComponent: function() {
      this.columns = [
        {
          header: 'ID',
          dataIndex: 'id',
          flex: 1
        }, {
          header: 'Title',
          dataIndex: 'title',
          flex: 1
        }
      ];
      return this.callParent(arguments);
    }
  });

}).call(this);