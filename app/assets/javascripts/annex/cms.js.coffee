ready = ->
  post_url = "/annex/blocks"

  # cmd+s saves the editor contents
  $(window).keydown (e) ->
    $(".redactor").addClass "active"  if (e.which is "17") and (e.ctrlKey or e.metaKey)
    return

  # on click of .redactor, fire up a redactor instance
  $("body").on "click", ".redactor", ->
    unless $(this).hasClass("redactor-editor")
      $(this).redactor
        focus: true
        imageUpload: '/annex/upload'
        imageManagerJson: '/annex/upload/images.json'
        fileUpload: '/annex/upload'
        fileManagerJson: '/annex/upload/files.json'
        plugins: [
          "definedlinks"
          "fontsize"
          "fontcolor"
          "table"
          "filemanager"
          "imagemanager"
          "video"
          "clips"
          "fullscreen"
          "save"
        ]
        toolbarFixed: false
        deniedTags: ['html', 'head', 'body', 'applet']

    return

  # on page load, look for texarea.redactor because those will always be CMS mode
  $("textarea.redactor").redactor
    focus: true
    plugins: [
      "clips"
      "fullscreen"
      "save"
    ]
    toolbarFixed: false

  return

$(document).ready(ready)
$(document).on('page:load', ready)
