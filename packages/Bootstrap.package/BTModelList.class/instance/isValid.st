testing
isValid
	querying := true.
	
	[^self allSatisfy: [ :entity | entity isValid ]] ensure: [ querying := false]