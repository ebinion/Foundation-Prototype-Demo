$ ->
  $(".js-trigger-timeform").on('click', (e) ->
    e.preventDefault()
    openTimeForm()
  )

  # This form shouldn't submit
  $("form").on('submit', (e) ->
    e.preventDefault();
    removeOldNewEntries()
    removeDefaultText()
    saveTimeForm()
    closeTimeForm()
  )

  $(".cancel").on('click', (e) ->
    e.preventDefault()
    closeTimeForm()
  )

# Methods
openTimeForm = ->
  $("#time-form").addClass("is-showing")
  $("#calendar-grid").addClass("is-hidden").removeClass("is-showing")

saveTimeForm = ->
  hours = $("#entry-hours").val()
  client = $("#entry-client").val()
  project = $("#entry-project").val()
  day = $("#entry-day").val()
  new_html = "<a href=\"#\" class=\"panel task is-new\"><strong>#{hours} hours</strong> on #{project} for #{client}</a>"
  $(new_html).insertAfter("##{day} header")

closeTimeForm = ->
  $("#time-form").removeClass("is-showing")
  $("#calendar-grid").removeClass("is-hidden").addClass("is-showing")

removeDefaultText = ->
  day = $("#entry-day").val()
  $("##{day} .task-empty").hide();

removeOldNewEntries = ->
  $(".is-new").removeClass("is-new")
