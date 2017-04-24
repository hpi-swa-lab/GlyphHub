accessing
defaultFont

	| candidates |
	candidates := (self fonts select: [:font |
		#('normal' 'regular') anySatisfy: [:word |
			font fontName includesSubstring: word caseSensitive: false]])
		ifEmpty: [self fonts].
	
	^ (candidates asArray sort: [:a :b | a fontName size < b fontName size]) first