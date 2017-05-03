updating
updateForm

	(form notNil and: [self extent = form extent]) ifTrue: [^ self].
	
	form := form
		ifNil: [Form extent: self extent depth: 32]
		ifNotNil: [form copy: (0 @ 0 extent: self extent)].

	pen := (Pen newOnForm: form)
		color: self penColor;
		roundNib: 4 * BTWidget scalingFactor