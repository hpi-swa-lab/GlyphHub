as yet unclassified
layoutChanged 
	super layoutChanged.
	self font ifNotNil: [ self detailPtSize: self calculateDetailPtSize ]