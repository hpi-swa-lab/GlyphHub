as yet unclassified
scalingMode: aMode
	" one of #rigid, #shrink, #fill "
	| resizing |
	scalingMode := aMode.

	resizing := scalingMode = #rigid
		ifTrue: [ #rigid ]
		ifFalse: [ #spaceFill ].

	self hResizing: resizing; vResizing: resizing