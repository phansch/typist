
// JS for typist

$(function() {
  initPage();
});
$(window).bind('page:change', function() {
  initPage();
});
function initPage() {
	//TODO: Get this from a rest api
	var text = 'iiii dddd iiii dddd iiii idi didi id'
	var arr = text.split(' ')

	$('#trainer').text(text);

	$('#typist').keydown(function(e) {
		var currentKey = String.fromCharCode(e.which).toLowerCase();
		var inputText = $('#typist').val() + currentKey

		if (inputText == arr[0] + ' ') {
			if (currentKey == ' ') {
				arr.shift()
				var text = arr.join(' ')
				$('#trainer').text(text);
				$('#typist').val('')
				return false;
			}
		} else {
			highlight_mistake()
			// Set input background to red
		}

	});

}

$(function() {
    $('#typist')
        .keyup(checkSpeed);
});
var iLastTime = 0;
var iTime = 0;
var iTotal = 0;
var iKeys = 0;

function checkSpeed() {
    iTime = new Date().getTime();

    if (iLastTime != 0) {
        iKeys++;
        iTotal += iTime - iLastTime;
        iWords = $('#typist').val().split(/\s/).length;
        $('#CPM').html(Math.round(iKeys / iTotal * 6000, 2));
        $('#WPM').html(Math.round(iWords / iTotal * 6000, 2));
    }

    iLastTime = iTime;
}

function highlight_mistake() {
	// body...
}

function compare_loop () {
	// body...
}