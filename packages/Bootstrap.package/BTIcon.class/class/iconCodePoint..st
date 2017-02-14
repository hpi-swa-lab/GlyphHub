as yet unclassified
iconCodePoint: anIconSymbol
	#(icons1 icons2 icons3 icons4 icons5 icons6 icons7) do: [ :method |
		(self perform: method) at: anIconSymbol ifPresent: [ :code |
			^Character codePoint: code ]].

	^''