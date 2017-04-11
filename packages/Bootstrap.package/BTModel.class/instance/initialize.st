initialize-release
initialize

	super initialize.
	
	dirtyFlags := Array new: self numberOfFields.
	querying := false.
	
	self
		privateId: 0;
		markAllDirty: true.
	
	self class associations keysAndValuesDo: [ :field :association |
		association cardinality = #many ifTrue: [
			self instVarNamed: field put: (BTModelList forField: field owner: self) ]]