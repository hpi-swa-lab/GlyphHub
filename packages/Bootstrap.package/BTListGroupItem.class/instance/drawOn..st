as yet unclassified
drawOn: aCanvas
	| bordered rounded |
	(self owner notNil and: [self owner isListGroup])
		ifTrue: [
			rounded := {false. false. false. false}.
			bordered := {true. true. false. true}.
			self isFirstChild ifTrue: [
				rounded at: 1 put: true; at: 2 put: true ].
			self isLastChild ifTrue: [
				rounded at: 3 put: true; at: 4 put: true.
				bordered at: 3 put: true ]]
		ifFalse: [
			rounded := {true. true. true. true}.
			bordered := {true. true. true. true} ].

	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: ({
			#background -> (hovered ifTrue: [BTWidget grayLighter] ifFalse: [BTWidget backgroundColor]).
			#border -> BTWidget grayLighter} as: Dictionary)
		rounded: rounded
		bordered: bordered