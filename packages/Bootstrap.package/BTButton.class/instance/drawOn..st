as yet unclassified
drawOn: aCanvas
	| bordered rounded |
	(self parent notNil and: [self parent isButtonGroup])
		ifTrue: [
			rounded := {false. false. false. false}.
			bordered := {true. false. true. true}.
			self isFirstChild ifTrue: [
				rounded at: 1 put: true; at: 4 put: true ].
			self isLastChild ifTrue: [
				rounded at: 2 put: true; at: 3 put: true.
				bordered at: 2 put: true ]]
		ifFalse: [
			rounded := {true. true. true. true}.
			bordered := {true. true. true. true} ].
	
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: self colorScheme
		rounded: rounded
		bordered: bordered