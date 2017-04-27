converting
underscoreToCamelCase: aString
	" converts user_name_association to userNameAssociation. Converts _id_string to idString "
	
	| inStream |
	inStream := aString readStream.
	^ (String streamContents: [:outStream |
		inStream peek = $_ ifTrue: [ inStream next ].
		
		[outStream nextPutAll: (inStream upTo: $_).
		inStream atEnd ifFalse: [outStream nextPut: inStream next asUppercase]] doWhileFalse: [inStream atEnd]]) contents