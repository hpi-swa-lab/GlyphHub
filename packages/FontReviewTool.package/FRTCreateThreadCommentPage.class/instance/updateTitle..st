updating
updateTitle: aThread

	titleContainer removeAllMorphs.  
	title := aThread isCreated
		ifTrue: [BTLabel subHeading: aThread title]
		ifFalse: [(BTTextArea placeholder: 'Enter Thread Title') expand: true; wrap: #never].
	titleContainer add: title