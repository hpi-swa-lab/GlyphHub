as yet unclassified
scalingMode: aMode
	" one of #rigid, #shrink, #fill, #full "
	| resizing |
	scalingMode := aMode.

	resizing := (scalingMode == #rigid or: [scalingMode == #full])
		ifTrue: [ #rigid ]
		ifFalse: [ #spaceFill ].

	self	hResizing: resizing;	vResizing: resizing; updateExtent