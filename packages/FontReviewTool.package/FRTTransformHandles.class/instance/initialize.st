initialize-release
initialize

	super initialize.
	
	transform := TransformationMorph new.
	resizeHandle := BTFloatingActionButton icon: #arrows_alt.
	moveHandle := BTFloatingActionButton icon: #arrows.
	
	self
		add: resizeHandle;
		add: moveHandle;
		add: transform;
		active: false