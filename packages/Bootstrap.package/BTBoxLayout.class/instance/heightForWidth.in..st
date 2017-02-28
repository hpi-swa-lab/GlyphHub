as yet unclassified
heightForWidth: aNumber in: aWidget
	| height minHeight |
	self setupDataFor: aWidget.
	  
	aWidget vertical
		ifTrue: [
			" simply ask each widget for its height using the given width "
			height := minHeight := aWidget spacing * (aWidget submorphCount - 1).
			childItems do: [ :child | | childHeight | 
				childHeight := child widget heightForWidth: aNumber.
				
				minHeight := minHeight + childHeight first.
				height := height + childHeight second ]]
		ifFalse: [ | items |
			" first do a layout pass to find the desired widths, then max out the possible height "
			height := minHeight := 0.
			items := self placeChildren: childItems copy of: aWidget space: aNumber.
			items do: [ :child | | childHeight |
				childHeight := child widget heightForWidth: aNumber.
				
				minHeight := minHeight max: childHeight first.
				height := height max: childHeight second ]].
	
	^{minHeight. height}