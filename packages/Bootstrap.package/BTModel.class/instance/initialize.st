initialize-release
initialize
	super initialize.
	
	dirtyFields := Array new: self numberOfFields.
	querying := false.
	
	self
		privateId: 0;
		markAllDirty: true.
	
	self class associations keysAndValuesDo: [ :field :association |
		association third = #many ifTrue: [
			self instVarNamed: field put: (BTModelList forField: field owner: self) ]]