as yet unclassified
initialize
	super initialize.
	
	tags := OrderedCollection new.
	inputBadge := BTBadge new.
	
	input := BTTextEntry new
		styleAttributes: BTBadge styleAttributes;
		wrap: #never;
		placeholder: 'New Tag ...';
		when: #confirmed evaluate: [ :text |
			text ifNotEmpty: [
				self add: (BTBadge text: text) before: inputBadge.
				self tags add: text.
				input clear ].
			nil ];
		yourself.
	
	inputBadge add: input.
	
	self
		withLayout;
		padding: (BTWidget spacing / 2) floor;
		add: inputBadge