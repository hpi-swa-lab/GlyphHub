private
current: aNumber
	(stack at: current) leaving.
	current := aNumber.
	(stack at: current) entering.
	
	self triggerOpened: (stack at: current)