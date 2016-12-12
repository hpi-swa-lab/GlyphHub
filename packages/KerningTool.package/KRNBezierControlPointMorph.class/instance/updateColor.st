accessing
updateColor
	self color: (self selected
		ifTrue: [ Color orange ]
		ifFalse: [ 
			self handleType caseOf: {
				[#auto] -> [ Color red ].
				[#free] -> [ Color green ].
				[#aligned] -> [ Color blue ]}])