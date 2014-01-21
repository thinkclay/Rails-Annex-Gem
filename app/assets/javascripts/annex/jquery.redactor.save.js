if (!RedactorPlugins) var RedactorPlugins = {};

RedactorPlugins.save = {
  init: function()
  {
    this.buttonAdd('save', 'Save', function(){
      this.saveContent();
    });
    this.buttonAddSeparator();
    this.buttonSetRight('save');
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

