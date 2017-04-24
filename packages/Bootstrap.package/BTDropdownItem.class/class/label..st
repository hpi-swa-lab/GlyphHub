instance creation
label: aString

	| label |
	label := (BTLabel text: aString).
	^ self new
		label: label;
		add: label