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
			input text ifNotEmpty: [
				self insert: (BTBadge text: input text) before: inputBadge.
				self tags add: input text.
				input clear ].
			nil ];
		yourself.
	
	inputBadge add: input.
	
	self
		withLayout;
		padding: (BTWidget spacing / 2) floor;
		add: inputBadge