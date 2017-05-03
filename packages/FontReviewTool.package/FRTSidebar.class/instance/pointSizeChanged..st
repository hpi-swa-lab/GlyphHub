updating
pointSizeChanged: aNumber

	aNumber
		ifEmpty: [self topLevel pointSizeChanged: self standardPointSize]
		ifNotEmpty: [
			aNumber isAllDigits
				ifTrue: [self topLevel pointSizeChanged: aNumber asNumber]
				ifFalse: [self topLevel displayNotification: 'Invalid point size' type: #info]]