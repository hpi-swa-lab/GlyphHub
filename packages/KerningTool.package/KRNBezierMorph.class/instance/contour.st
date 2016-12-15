event handling
contour
	^ self owner ifNil: [ KRNNullContour new ] ifNotNil: [ self owner ]