ready = ->
  redactor_options = {
    focus: true
    buttonSource: true
    plugins: [
      'fontsize'
      'fontcolor'
      'table'
      'video'
      'uploadcare'
      'save'
    ]
    formatting: ['p', 'blockquote', 'pre', 'code', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6']
    toolbarExternal: '#cms-tools'
    uploadcare:
      # see https://uploadcare.com/documentation/widget/#configuration
      publicKey: 'aa8af20dfd52aaf02a89'
      crop: 'free'
      tabs: 'all'
  }

  # on click of .redactor, fire up a redactor instance
  $('body').on 'dblclick', '.redactor', ->
    unless $(this).hasClass("redactor-editor")
      $(this).redactor(redactor_options)

$(document).ready(ready)
$(document).on('page:load', ready)
