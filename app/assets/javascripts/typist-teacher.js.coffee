iLastTime = 0
iTime = 0
iTotal = 0
iKeys = 0
arr = []

# JS for typist
initPage = ->
  #TODO: Get this from a rest api
  text = "id"
  arr = text.split(" ")
  $("#trainer").text text
  $("#typist").keydown (e) ->
    currentKey = String.fromCharCode(e.which).toLowerCase()
    inputText = $("#typist").val() + currentKey
    if inputText is arr[0] + " "
      if currentKey is " "
        arr.shift()
        text = arr.join(" ")
        $("#trainer").text text
        $("#typist").val ""
        return false

  # Once the
  $("#typist").keyup ->
    if arr.length is 0
        $.ajax "/users/#{userid}.json",
          type: 'PATCH'
          dataType: 'json'
          contentType: "application/json"
          data: JSON.stringify({user:{WPM:40}})
          error: (jqXHR, textStatus, errorThrown) ->
            $('body').append "AJAX Error: #{textStatus}"
          success: (data, textStatus, jqXHR) ->
            $('body').append "Successful AJAX call: #{data}"

      # submit wpm



checkSpeed = ->
  iTime = new Date().getTime()
  unless iLastTime is 0
    iKeys++
    iTotal += iTime - iLastTime
    iWords = $("#typist").val().split(" ").length
    $("#CPM").html Math.round(iKeys / iTotal * 6000, 2)
    $("#WPM").html Math.round(iWords / iTotal * 6000, 2)
  iLastTime = iTime

# body...
$(window).bind "page:change", ->
  initPage()

$ ->
  $("#typist").keyup ->
    checkSpeed
    if $("#trainer").text.length is 0
      $("#trainer").text "bla"
  initPage()







