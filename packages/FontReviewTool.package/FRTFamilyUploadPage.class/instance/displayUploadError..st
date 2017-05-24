callback
displayUploadError: anErrorString

	fileSelectButton disabled: false.
	alertArea add: (BTAlert text: 'Converting your font failed! ', anErrorString asHtml type: #danger)