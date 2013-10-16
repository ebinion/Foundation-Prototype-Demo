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

  $(".mobile-day-controller").on('click', (e) ->
    e.preventDefault()
    reClassMobileDayController(this)
    changeMobileDayView(this)
    updateDayFormSelector(this)
  )

  $(".js-deadLink").on('click', (e)->
    e.preventDefault()
    window.alert("Sorry, that link is inactive. Is there anything else you would click on?")
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

reClassMobileDayController = ($this)->
  $(".mobile-day-controller").not($this).removeClass("is-active")
  $($this).addClass("is-active")

changeMobileDayView = ($this)->
  $(".day-column.is-active").removeClass("is-active")
  $( $($this).attr("href") ).addClass("is-active")

updateDayFormSelector = ($this)->
  day = $($this).attr("href").replace("#", "")
  $("#entry-day option").attr("selected", false)
  $("#entry-day option[value=\"#{day}\"").attr("selected", true)

