change reporting
layoutChanged 
	super layoutChanged.
	self font ifNotNil: [ self detailPtSize: self calculateDetailPtSize ]