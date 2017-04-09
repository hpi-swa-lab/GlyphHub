accessing
form: aForm sourceRectangle: aRectangle targetSize: aPoint
	" Note for HiDPI: aRectangle's extent is always the real size of the desired portion of the form.
	  aPoint however will be scaled by the scalingFactor "

	| size |
	size := aPoint asPoint.
	form := (aForm copy: aRectangle) scaledToSize: size * BTWidget scalingFactor.
	
	self
		minSize: size;
		size: size