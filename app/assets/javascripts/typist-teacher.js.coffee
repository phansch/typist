# Ugly stuff. Better close your eyes.

class SpeedTracker
  iLastTime = 0
  timeCurrent = 0
  timeTotal = 0
  keycount = 0
  wordcount = 0

  printSpeed: ->
    data = calculateSpeed()
    $("#CPM").html(data.cpm)
    $("#WPM").html(data.wpm)
    data

  calculateSpeed = ->
    timeCurrent = new Date().getTime()
    unless iLastTime is 0
      keycount++
      wordcount = window.wordcount
      timeTotal += timeCurrent - iLastTime
      cpm = Math.round(keycount / timeTotal * 60000, 2)
      wpm = Math.round(wordcount / timeTotal * 6000, 2)
    iLastTime = timeCurrent
    return { "wpm": wpm, "cpm": cpm }


class Practice
  arr = []

  submitPracticeScore = (practice_data) ->
    $.ajax "/practices",
      type: 'POST'
      dataType: 'json'
      contentType: "application/json"
      data: JSON .stringify({practice:practice_data})
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (practice_data, textStatus, jqXHR) ->
        $('body').append "Successful AJAX call: #{practice_data}"

  updatePracticeText = (text) ->
    arr.shift()
    text = arr.join(" ")
    $("#trainer").text text
    $("#typist").val ""
    return false

  startPractice: (tracker, lesson_id = 1) ->
    trainer = $("#trainer")
    typist = $("#typist")
    arr = []
    window.wordcount = 0
    $.get "/lessons/#{lesson_id}.json", (lesson_data) ->
      arr = lesson_data.text.split(" ")
      trainer.text lesson_data.text

    typist.keydown (e) ->
      currentKey = String.fromCharCode(e.which).toLowerCase()
      inputText = typist.val() + currentKey

      if inputText is arr[0] + " "
        window.wordcount += 1
        updatePracticeText(inputText)

    typist.keyup ->
      data = tracker.printSpeed()

      if arr.length is 0
        data.user_id = window.userid
        data.lesson_id = lesson_id
        submitPracticeScore(data)
        (new Practice).startPractice(new SpeedTracker, lesson_id + 1) # bad?

@initPage = ->
  (new Practice).startPractice(new SpeedTracker)
  $('.lesson-link').click (e) ->
    if not isNaN(e.target.id)
      (new Practice).startPractice(new SpeedTracker, e.target.id)
    e.preventDefault()

$(document).on "page:load", ->
  initPage()

$ ->
  initPage()
