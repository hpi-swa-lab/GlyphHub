initialize-release
update: aParameter
	super update: aParameter.
	
	aParameter == #pointMoved ifTrue: [ self updateExtent ]