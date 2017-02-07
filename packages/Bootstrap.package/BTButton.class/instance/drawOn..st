as yet unclassified
drawOn: aCanvas
	| bordered rounded colors |
	(self owner notNil and: [self owner isButtonGroup])
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
	
	colors := (BTWidget colorsForType: colorType).
	hovered ifTrue: [
		colors
			at: #background put: ((colors at: #background) adjustBrightness: -0.1);
			at: #border put: ((colors at: #border) adjustBrightness: -0.12) ].
	
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: colors
		rounded: rounded
		bordered: bordered