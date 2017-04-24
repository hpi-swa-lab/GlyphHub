as yet unclassified
testDefaultFont

	| family |
	family := self familyWithFontsNamed: #('Mirza-Regular' 'Mirza-Bold').
	(self expect: family defaultFont fontName) to equal: 'Mirza-Regular'.
	
	family := self familyWithFontsNamed: #('Mirza-Regular' 'Mirza-Regular-Wider').
	(self expect: family defaultFont fontName) to equal: 'Mirza-Regular'.
	
	family := self familyWithFontsNamed: #('Mirza' 'Mirza-Bold').
	(self expect: family defaultFont fontName) to equal: 'Mirza'