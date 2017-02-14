as yet unclassified
initialize
	super initialize.
	
	tags := OrderedCollection new.
	inputBadge := BTBadge new.
	
	input := BTTextEntry new
		styleAttributes: BTBadge styleAttributes;
		fillMode: #fixed;
		placeholder: 'New Tag ...';
		returnDo: [
			self insert: (BTBadge text: input text) before: inputBadge.
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