ready = ->
  post_url = "/annex/blocks"
  $(window).keydown (e) ->
    $(".redactor").addClass "active"  if (e.which is "17") and (e.ctrlKey or e.metaKey)
    return

  $(".redactor").click ->
    unless $(this).hasClass("redactor_editor")
      $(this).redactor
        focus: true
        plugins: [
          "clips"
          "fullscreen"
          "save"
        ]
        toolbarFixed: false

    return

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
