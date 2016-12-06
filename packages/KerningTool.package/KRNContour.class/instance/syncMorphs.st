segments
syncMorphs
	| p scale |
	scale := 0.03.
	self
		removeAllMorphs;
		segmentsDoLine: [ :points |
			p := points collect: [ :point | point x @ point y negated * scale ].
			self addSegment: (KRNLineMorph newFrom: p first to: p second) ]
		cubic: [ :points |
			p := points collect: [ :point | point x @ point y negated * scale ].
			self addSegment: (KRNBezierMorph newFrom: p first via: p second and: p third to: p fourth) ]
		conic: [ :points |  ]