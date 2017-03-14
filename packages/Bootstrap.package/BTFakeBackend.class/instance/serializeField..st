as yet unclassified
serializeField: anObject
	^anObject isBTModel
		ifTrue: [ anObject id ]
		ifFalse: [
			anObject isBTModelList
				ifTrue: [ nil " collections are saved on the other side for 1:n " ]
				ifFalse: [ anObject ]]