converting
camelCaseToUnderscore: aString
	" converts userNameAssociation to user_name_association . Converts idString to _id_string "
	
	| inStream |
	inStream := aString readStream.
	^ (String streamContents: [ :outStream |
		[inStream atEnd] whileFalse:
		[[inStream atEnd not and: [inStream peek isUppercase not]] whileTrue: [outStream nextPut: inStream next].
		
		inStream atEnd ifFalse: [
			outStream
				nextPut: $_;
				nextPut: inStream next asLowercase ]]]) contents