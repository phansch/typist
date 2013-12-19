// Declares global variables Practice and SpeedTracker
// var declares a variable in the current scope
var Practice, SpeedTracker;

// Define SpeedTracker object, self executing
// At the end of the object definition is a (); which executes the function
SpeedTracker = (function() {
  // Function declaration (?)
  var calculateSpeed, iLastTime, keycount, timeCurrent, timeTotal, wordcount;

  // The constructor
  function SpeedTracker() {}

  // Local variables
  var iLastTime = 0;
  var timeCurrent = 0;
  var timeTotal = 0;
  var keycount = 0;
  var wordcount = 0;

  // Create a prototype and assign an anonymous function (function expression) to it 
  // What is a prototype?
  SpeedTracker.prototype.printSpeed = function() {
    var data;
    data = calculateSpeed();
    $("#CPM").html(data.cpm);
    $("#WPM").html(data.wpm);
    return data;
  };
  
  // This is a function expression as well
  calculateSpeed = function() {
    var cpm, wpm;
    timeCurrent = new Date().getTime();
    if (iLastTime !== 0) {
      keycount++;
      wordcount = window.wordcount;
      timeTotal += timeCurrent - iLastTime;
      cpm = Math.round(keycount / timeTotal * 60000, 2);
      wpm = Math.round(wordcount / timeTotal * 6000, 2);
    }
    iLastTime = timeCurrent;
    // Return an object
    return {
      "wpm": wpm,
      "cpm": cpm
    };
  };

  return SpeedTracker;

})(); // Execute the function here

Practice = (function() {
  var arr, submitPracticeScore, updatePracticeText;

  function Practice() {}

  arr = [];

  submitPracticeScore = function(practice_data) {
    return $.ajax("/practices", {
      type: 'POST',
      dataType: 'json',
      contentType: "application/json",
      data: JSON.stringify({
        practice: practice_data
      }),
      error: function(jqXHR, textStatus, errorThrown) {
        return $('body').append("AJAX Error: " + textStatus);
      },
      success: function(practice_data, textStatus, jqXHR) {
        return $('body').append("Successful AJAX call: " + practice_data);
      }
    });
  };

  updatePracticeText = function(text) {
    arr.shift();
    text = arr.join(" ");
    $("#trainer").text(text);
    $("#typist").val("");
    return false;
  };

  Practice.prototype.startPractice = function(tracker, lesson_id) {
    var trainer, typist;
    if (lesson_id == null) {
      lesson_id = 1;
    }
    trainer = $("#trainer");
    typist = $("#typist");
    arr = [];
    window.wordcount = 0;
    $.get("/lessons/" + lesson_id + ".json", function(lesson_data) {
      arr = lesson_data.text.split(" ");
      return trainer.text(lesson_data.text);
    });
    typist.keydown(function(e) {
      var currentKey, inputText;
      currentKey = String.fromCharCode(e.which).toLowerCase();
      inputText = typist.val() + currentKey;
      if (inputText === arr[0] + " ") {
        window.wordcount += 1;
        return updatePracticeText(inputText);
      }
    });
    return typist.keyup(function() {
      var data;
      data = tracker.printSpeed();
      if (arr.length === 0) {
        data.user_id = window.userid;
        data.lesson_id = lesson_id;
        submitPracticeScore(data);
        return (new Practice).startPractice(new SpeedTracker, lesson_id + 1);
      }
    });
  };

  return Practice;

})();

this.initPage = function() {
  (new Practice).startPractice(new SpeedTracker);
  $("#typist").focus();
  return $('.lesson-link').click(function(e) {
    if (!isNaN(e.target.id)) {
      (new Practice).startPractice(new SpeedTracker, e.target.id);
    }
    return e.preventDefault();
  });
};

//Making sure the page is loaded correctly with turbolinks as well
$(document).on("page:load", function() {
  return initPage();
});

$(function() {
  return initPage();
});

