initialize-release
initialize

	super initialize.
	
	inputBadge := BTBadge new.
	
	input := BTTextEntry new
		wrap: #never;
		placeholder: 'New Tag ...';
		when: #confirmed evaluate: [:text |
			text ifNotEmpty: [
				self
					addTag: text;
					triggerTagAdded: text].
			nil];
		yourself.
	BTBadge applyStyleAtributes: input.

	self add: (inputBadge add: input)