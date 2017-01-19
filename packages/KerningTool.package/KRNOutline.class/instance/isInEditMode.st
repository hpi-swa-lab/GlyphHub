as yet unclassified
isInEditMode
	^ self contours anySatisfy:  [:c | c hasSubmorphs ]