accessing
asWidget

	^ self typeSymbol = #picture
		ifTrue: [BTImage load: 'attachment/', self id, '/resource' from: self backend]
		ifFalse: [self error: 'Attachment Type not implemented']