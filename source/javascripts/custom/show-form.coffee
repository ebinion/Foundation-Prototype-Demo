$ ->
  $(".js-trigger-timeform").on('click', (e) ->
    e.preventDefault()
    openTimeForm()
  )

  # This form shouldn't submit
  $("form").on('submit', (e) ->
    e.preventDefault();
    closeTimeForm()
  )

# Methods
openTimeForm = ->
  $("#time-form").addClass("is-showing")

closeTimeForm = ->
  $("#time-form").removeClass("is-showing")
