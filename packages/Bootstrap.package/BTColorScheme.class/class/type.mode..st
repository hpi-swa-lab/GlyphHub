initialize-release
type: aType mode: aMode
	" aType: one of #secondary, #primary, #success, #warning, #danger, #info.
	  aMode: one of #normal, #state, #invert, #outline, (#darker: only for #secondary) "
	^(self perform: (aType asString, ':') asSymbol with: aMode)
		privateType: aType;
		privateMode: aMode;
		yourself