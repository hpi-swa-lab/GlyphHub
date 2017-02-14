as yet unclassified
initialize
	super initialize.
	
	self
		size: 600 @ 800;
		add: (BTButtonGroup new
			colorType: #secondary;
			add: (BTButton icon: #list);
			add: (BTButton icon: #th_large));
		add: (BTLabel heading: 'Does this A look fat to you?');
		add: (BTAlert text: (BTIcon icon: #bell), ' 5 new entries since you last visited this topic');
		add: (self post: 'Manfred Mann - 12:40' content: 'So yeah this is my first project and I would really appreciate some feedback on the shapes. Thanks!' picture: 'cat.jpg');
		add: (self post: 'Alred Al - 11:10' content: 'Looks OK to me.' picture: 'penguin.png');
		add: self complexPost;
		add: (self post: 'Alred Al - 11:20' content: 'Nah dont think thats a good idea' picture: 'penguin.png');
		add: (BTTextArea placeholder: 'Your message ...');
		add: ((BTButton label: 'Create Post' icon: #pencil) colorType: #primary)