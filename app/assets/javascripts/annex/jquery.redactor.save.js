if (!RedactorPlugins) var RedactorPlugins = {};

RedactorPlugins.save = {
  init: function()
  {
    this.buttonAdd('save', 'Save', function(){
      this.saveContent();
    });
    this.buttonAddSeparator();
    this.buttonSetRight('save');

    save_shortcut = $.proxy(function(e){
      var editor_active = this.getEditor().hasClass('redactor_editor');

      if ( editor_active )
        this.saveContent();

      return editor_active;
    }, this);

    $(document).keydown(function(e){
      if ((e.which == '115' || e.which == '83' ) && (e.ctrlKey || e.metaKey))
      {
        if ( save_shortcut() )
        {
          e.preventDefault();

          return false;
        }
      }

      return true;
    });
  },
  saveContent: function() {

    var post_url = '/annex/blocks',
        route = this.getEditor().attr('data-route'),
        identifier = this.getEditor().attr('data-identifier');

    var callback = $.proxy(function() {
      var $this = this;
      var editor = this.getEditor();

      editor.addClass('saved')
        .delay(1000)
        .queue(function(next){
          $(this).removeClass('saved');
          next();
        });

        setTimeout(function(){ $this.destroy(); }, 2000);
    }, this);

    $.ajax({
      type:         'POST',
      url:          post_url,
      contentType:  'application/json',
      data:         '{"route": "'+route+'", "content": {"'+identifier+'": "'+this.get()+'"} }',
      success: callback,
      dataType: 'json'
    });
  }
};

