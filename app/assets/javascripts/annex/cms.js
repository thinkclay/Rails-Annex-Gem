$(function(){
  var post_url = '/annex/blocks';

  $(window).keydown(function(e){
    if ((e.which == '17') && (e.ctrlKey || e.metaKey))
    {
      $('.redactor').addClass('active');
    }
  });

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
    });
});