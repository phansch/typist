# Ugly stuff. Better close your eyes.

class SpeedTracker
  iLastTime = 0
  timeCurrent = 0
  timeTotal = 0
  keycount = 0
  wordcount = 0
  cpm: 0
  wpm: 0

  updateSpeed: ->
    timeCurrent = new Date().getTime()
    unless iLastTime is 0
      keycount++
      wordcount = $("#typist").val().split(" ").length
      timeTotal += timeCurrent - iLastTime
      cpm = Math.round(keycount / timeTotal * 6000, 2)
      wpm = Math.round(wordcount / timeTotal * 6000, 2)
    iLastTime = timeCurrent
    return { "wpm": wpm, "cpm": cpm }

arr = []

initPage = (tracker) ->
  # DO: Get this text from a rest api
  text = "iiii dddd iiii dddd id"
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

  $("#typist").keyup ->
    if arr.length is 0
        $.ajax "/users/#{userid}.json",
          type: 'PATCH'
          dataType: 'json'
          contentType: "application/json"
          data: JSON .stringify({user:{WPM:30}})
          error: (jqXHR, textStatus, errorThrown) ->
            $('body').append "AJAX Error: #{textStatus}"
          success: (data, textStatus, jqXHR) ->
            $('body').append "Successful AJAX call: #{data}"

# body...
$(window).bind "page:change", ->
  initPage(tracker)

$ ->
  $("#typist").keyup ->
    tracker = new SpeedTracker

    console.log(data)
    data = tracker.updateSpeed(tracker)
    $("#CPM").html data.cpm
    $("#WPM").html data.wpm

    if $("#trainer").text.length is 0
      $("#trainer").text "bla"

  initPage()