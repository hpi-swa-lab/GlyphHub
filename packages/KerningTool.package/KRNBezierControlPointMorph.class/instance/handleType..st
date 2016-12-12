accessing
handleType: aHandleType
	handleType := aHandleType.
	
	self color: (aHandleType caseOf: {
		[#auto] -> [ Color red ].
		[#free] -> [ Color green ].
		[#aligned] -> [ Color blue ].
		[#selected] -> [ Color orange ]})