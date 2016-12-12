as yet unclassified
handleType: aHandleType
	self onSelected ifNotNil: [  
		self onSelected value: aHandleType ].
	self delete