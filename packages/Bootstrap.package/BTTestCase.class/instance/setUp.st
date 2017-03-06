running
setUp
	previousScalingFactor := BTWidget scalingFactor.
	BTWidget scalingFactor: 1.
	
	spies := OrderedCollection new.