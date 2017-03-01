as yet unclassified
drawOn: aCanvas
	| bordered rounded |
	(self parent notNil and: [self parent isNavigation])
		ifTrue: [
			self active
				ifTrue: [
					bordered := {true. true. false. true}.
					rounded := {true. true. false. false} ]
				ifFalse: [
					bordered := {false. false. true. false}.
					rounded := {false. false. false. false} ]]
		ifFalse: [
			rounded := {true. true. true. true}.
			bordered := {true. true. true. true} ].

	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: (self colorScheme background: nil)
		rounded: rounded
		bordered: bordered