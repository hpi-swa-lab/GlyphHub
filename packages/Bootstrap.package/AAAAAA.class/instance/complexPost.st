as yet unclassified
complexPost
	| post |
	post := self post: 'Tom Beckmann - 11:15' content: 'How about making the stem a little stronger along this line?' picture: 'penguin2.jpg'.

	post submorphs second
		add: (BTPage row add: (BTFloatingActionButton icon: #comment); add: (BTFloatingActionButton icon: #pencil)).

	^post