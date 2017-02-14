as yet unclassified
alignItems: aCollection
	" a pair (horizontal, vertical) or #center, #start, #end, #fill.
	
	NOTE: always set vertical: before using this property, otherwise x and y will be flipped "
	
	| primary secondary wrapListCentering prefix suffix vertical |
	
	vertical := self listDirection == #topToBottom.
	
	vertical not
		ifTrue: [
			primary := aCollection first.
			secondary := aCollection second ]
		ifFalse: [
			primary := aCollection second.
			secondary := aCollection first ].
	
	" using #start/#end allows for RTL ui support later on "
	" FIXME according to the their comments, wrapCentering: and listCentering: do the same thing. we set both. "
	wrapListCentering := ({ #center -> #center. #start -> #topLeft. #end -> #bottomRight. #fill -> #justified } as: Dictionary) at: primary.
	
	prefix := ({
		#start -> (vertical ifTrue: [#top] ifFalse: [#left]).
		#end -> (vertical ifTrue: [#bottom] ifFalse: [#right]) } as: Dictionary) at: secondary ifAbsent: [].
	suffix := ({#center -> #Center. #start -> #Left. #end -> #Right} as: Dictionary) at: primary ifAbsent: [].
	
	self
		wrapCentering: wrapListCentering;
		listCentering: wrapListCentering;
		cellPositioning: ((secondary == #center or: [secondary == #fill])
			ifTrue: [#center]
			ifFalse: [(prefix asString, suffix asString) asSymbol])