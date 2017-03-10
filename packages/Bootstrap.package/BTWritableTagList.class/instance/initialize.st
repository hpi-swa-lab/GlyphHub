as yet unclassified
initialize
	super initialize.
	
	inputBadge := BTBadge new.
	
	input := BTTextEntry new
		styleAttributes: BTBadge styleAttributes;
		wrap: #never;
		placeholder: 'New Tag ...';
		when: #confirmed evaluate: [ :text |
			text ifNotEmpty: [
				self addTag: text].
			nil ];
		yourself.

	self add: (inputBadge add: input)