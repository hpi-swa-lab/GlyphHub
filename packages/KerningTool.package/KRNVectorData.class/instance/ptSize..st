accessing
ptSize: aNumber
	super ptSize: aNumber.
	self components do: [ :component | component ptSize: aNumber ].
	self	updateExtent.
	self outline contours do: [ :contour |
		contour points: (contour points collect: [ :point |
			{((point first) * self ptSize * 64 / self font unitsPerEm). point second}])].