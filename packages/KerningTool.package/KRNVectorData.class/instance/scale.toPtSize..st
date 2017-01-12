accessing
scale: aFlyweight toPtSize: aNumber
	| newOutline newComponentOutlines |
	"mach was mit den components"
	newOutline := outline copy.
	newOutline contours do: [ :contour |
		contour points: (contour points collect: [ :point |
			{((point first) * aFlyweight ptSize * 64 / aFlyweight font unitsPerEm). point second}]).
			contour updateExtent].
	newOutline updateExtent.
	newComponentOutlines := OrderedCollection new.
	self components do: [ :component | | newComponentOutline |
		newComponentOutline := component outline copy.
		newComponentOutline contours do: [ :contour |
			contour points: (contour points collect: [ :point |
			{((point first) * aFlyweight ptSize * 64 / aFlyweight font unitsPerEm). point second}]).
			contour updateExtent].
		newComponentOutline updateExtent.
		newComponentOutlines add: newComponentOutline].
	aFlyweight
		add: #outline withRenderData: newOutline;
		add: #components withRenderData: newComponentOutlines