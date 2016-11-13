*KerningTool
pixelColor: aColor toAlpha: alphaColor
	| alpha1 alpha2 alpha3 alpha4 out outAlpha alpha |
	out := self colorToArray: aColor.
	alpha := self colorToArray: alphaColor.

	alpha1 := self compareColor: out first toAlpha: alpha first.
	alpha2 := self compareColor: out second toAlpha: alpha second.
	alpha3 := self compareColor: out third toAlpha: alpha third.
	alpha4 := out fourth.

	out at: 4 put: ((alpha1 max: alpha2) max: alpha3) * 255.0.

	out fourth < 1.0 ifTrue: [ ^Color fromArray: out / 255.0 ].
	outAlpha := out fourth.
	out := (out - alpha) / out fourth * 255.0 + alpha.
	out at: 4 put: outAlpha * alpha4 / 255.0.
	
	^Color fromArray: out / 255.0