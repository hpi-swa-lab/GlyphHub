as yet unclassified
makeActive: newActiveTab
	| oldActiveTab |
	oldActiveTab := submorphs detect: [:each | each active] ifNone: [ nil ].
	self tabSwitchedDo valueWithEnoughArguments: { newActiveTab . oldActiveTab }