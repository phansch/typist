
// JS for typist

$(document).ready(function () {
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
			// Set input background to red
		}

	});
});

function highlight_mistake() {
	// body...
}

function compare_loop () {
	// body...
}