as yet unclassified
initialize
	super initialize.
	
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	
	self add: (BTButtonGroup new
		colorType: #secondary;
		add: (BTButton icon: #list);
		add: (BTButton icon: #th_large)).
	self add: (BTLabel heading: 'Does this A look fat to you?').
	self add: (self post: 'Manfred Mann - 12:40' content: 'So yeah this is my first project and I would really appreciate some feedback on the shapes. Thanks!' picture: 'cat.jpg').
	self add: (self post: 'Alred Al - 11:10' content: 'Looks OK to me.' picture: 'penguin.png').
	self add: self complexPost.
	self add: (self post: 'Alred Al - 11:20' content: 'Nah dont think thats a good idea' picture: 'penguin.png').
	self add: (BTTextEntry new placeholder: 'Your message ...').
	self add: (BTButton label: 'Create Post' icon: #pencil)