as yet unclassified
detailViewBounds: bounds
	(bounds = self detailViewBounds)
		ifFalse: [ detailViewBounds := bounds.
			self updateDetailView: self detailViewText ]
		
	
	