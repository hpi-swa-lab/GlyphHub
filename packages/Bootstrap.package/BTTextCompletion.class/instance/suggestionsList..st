accessing
suggestionsList: aCollection
	" expects a list of tupels of {label. userdata} that will be offered as options,
	alternatively only pass in Labels to get the same string as userdata"
	suggestionsList := aCollection
		collect: [ :each | each isString
			ifTrue: [ {each. each} ]
			ifFalse: [ each ]]