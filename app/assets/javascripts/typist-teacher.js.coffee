# Ugly stuff. Better close your eyes.

class SpeedTracker
  iLastTime = 0
  timeCurrent = 0
  timeTotal = 0
  keycount = 0
  wordcount = 0

  updateSpeed: ->
    cpm = 0
    wpm = 0
    timeCurrent = new Date().getTime()
    unless iLastTime is 0
      keycount++
      wordcount = $("#typist").val().split(" ").length
      timeTotal += timeCurrent - iLastTime
      cpm = Math.round(keycount / timeTotal * 6000, 2)
      wpm = Math.round(wordcount / timeTotal * 6000, 2)
    iLastTime = timeCurrent
    return { "wpm": wpm, "cpm": cpm }


class Typist
  data = 0

  this.retrieveLesson = (id) ->
    $.ajax({
      url: "/lessons/#{id}.json",
      success: Typist.retrieveLesson,
    });
    $.get "/lessons/#{id}.json", (data) ->
      # How to pass data to calling function?
      return data
    console.log(data)
    return data


  this.submitScore = (lesson_id, data) ->
    $.ajax "/users/#{userid}.json",
      type: 'PATCH'
      dataType: 'json'
      contentType: "application/json"
      data: JSON .stringify({user:{WPM:data.wpm}})
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('body').append "Successful AJAX call: #{data}"


initPage = (tracker) ->
  trainer = $("#trainer")
  typist = $("#typist")

  data = Typist.retrieveLesson(1)

  # console.log(data)
  arr = data.text.split(" ")
  trainer.text data.text

  typist.keydown (e) ->
    currentKey = String.fromCharCode(e.which).toLowerCase()
    inputText = typist.val() + currentKey

    if inputText is arr[0] + " "
      arr.shift()
      text = arr.join(" ")
      trainer.text text
      typist.val ""
      return false

  typist.keyup ->
    data = tracker.updateSpeed(tracker)
    $("#CPM").html data.cpm
    $("#WPM").html data.wpm

    if arr.length is 0
      current_lesson = {}
      current_lesson["id"] = 0
      Typist.submitScore(current_lesson.id, data)

# body...
@tracker = new SpeedTracker

$(window).bind "page:change", ->
  initPage(tracker)

$ ->
  initPage(tracker)