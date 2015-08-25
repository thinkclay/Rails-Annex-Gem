if (!RedactorPlugins) var RedactorPlugins = {};

RedactorPlugins.save = function()
{
  return {
    init: function()
    {
      var button = this.button.add('save', 'Save');
      this.button.setAwesome('save', 'fa-floppy-o');
      this.button.addCallback(button, this.save.content);

      save_shortcut = $.proxy(function(e){
        var editor_active = this.$editor.hasClass('redactor-editor');

        if (editor_active)
          this.save.content();

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
    content: function() {
      var post_url = '/annex/blocks',
          route = this.$editor.attr('data-route'),
          identifier = this.$editor.attr('data-identifier'),
          html_content = {};

      var callback = $.proxy(function() {
        alert('Saved Content');
        this.core.destroy();
      }, this);

      html_content[identifier] = this.code.get();

      $.ajax({
        type: 'POST',
        url: post_url,
        data: {
          identifier: identifier,
          route: route,
          content: html_content
        },
        success: callback,
        dataType: 'json'
      });
    }
  };
};

