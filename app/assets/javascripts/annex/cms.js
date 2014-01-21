$(function(){
  var post_url = '/annex/blocks';

  $('.redactor')
    .click(function(){
      if ( ! $(this).hasClass('redactor_editor') )
      {
        $(this).redactor({
          focus: true,
          plugins: ['clips', 'fullscreen', 'save'],
          toolbarFixed: false
        });
      }
    })
    // .blur(function(){
    //   if ( $(this).hasClass('redactor_editor') )
    //   {
    //     var $this = $(this);

    //     $this.redactor('saveContent');
    //     setTimeout(function(){ $this.redactor('destroy'); }, 2000);
    //   }
    // });
});