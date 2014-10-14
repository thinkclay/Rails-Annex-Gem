if (!RedactorPlugins) var RedactorPlugins = {};

RedactorPlugins.save = function()
{
  return {
    init: function()
    {
      var button = this.button.add('save', 'Save');
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
        var $this = this;
        var editor = this.$editor;

        editor.addClass('saved')
          .delay(1000)
          .queue(function(next){
            $(this).removeClass('saved');
            next();
          });

        setTimeout(function(){ $this.core.destroy(); }, 2000);
      }, this);

      html_content[identifier] = this.code.get();

      $.ajax({
        type: 'POST',
        url: post_url,
        data: {
          route: route,
          content: html_content
        },
        success: callback,
        dataType: 'json'
      });
    }
  };
};

