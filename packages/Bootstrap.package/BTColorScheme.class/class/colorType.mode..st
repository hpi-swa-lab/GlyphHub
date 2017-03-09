initialize-release
colorType: aColorType mode: aMode
	" aType: one of #secondary, #primary, #success, #warning, #danger, #info.
	  aMode: one of #normal, #state, #invert, #outline, (#darker: only for #secondary) "
	^(self perform: (aColorType asString, ':') asSymbol with: aMode)
		privateColorType: aColorType;
		privateMode: aMode;
		yourself