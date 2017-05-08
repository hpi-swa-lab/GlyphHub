variations
disabled

	^ BTColorScheme
		withForeground: (self foreground ifNotNilDo: [:color | color alpha: 0.5])
		background: (self background ifNotNilDo: [:color | color alpha: 0.5])
		border: (self border ifNotNilDo: [:color | color alpha: 0.5])