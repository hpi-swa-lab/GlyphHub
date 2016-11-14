*KerningTool
compareColor: current toAlpha: alpha
	current > alpha ifTrue: [
		^(current - alpha) / (255.0 - alpha) ].
	
	current < alpha ifTrue: [
		^(alpha - current) / alpha ].
	
	^0.0