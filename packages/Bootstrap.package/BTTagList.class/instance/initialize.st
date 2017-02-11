as yet unclassified
initialize
	super initialize.
	
	colorType := #secondary.
	tags := OrderedCollection new.
	
	inputBadge := BTBadge new colorType: colorType.
	
	input := BTTextEntry new
		styleAttributes: BTBadge styleAttributes;
		fillMode: #fixed;
		color: Color white;
		placeholder: 'New Tag ...';
		returnDo: [
			self insert: ((BTBadge text: input text) colorType: colorType) before: inputBadge.
			self tags add: input text.
			input clear.
			nil ];
		yourself.
	
	inputBadge add: input.
	
	self
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: (BTWidget spacing / 2) floor;
		hResizing: #shrinkWrap;  
		vResizing: #shrinkWrap;  
		add: inputBadge