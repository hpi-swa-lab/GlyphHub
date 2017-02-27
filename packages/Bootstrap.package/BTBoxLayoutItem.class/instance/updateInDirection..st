as yet unclassified
updateInDirection: isVertical
	" update our min and nat sizes along the layout direction and return those two values for the non-layout direction "
	| minAndNat |
	minAndNat := self widget preferredSize.
	vertical := isVertical.
	
	self
		expanding: ((self widget wantsExpandIn: isVertical) at: (isVertical ifTrue: [2] ifFalse: [1]));
		minSize: (isVertical ifTrue: [minAndNat first y] ifFalse: [minAndNat first x]);
		naturalSize: (isVertical ifTrue: [minAndNat second y] ifFalse: [minAndNat second x]).
		
	self finalSize: self minSize.
	
	^{isVertical ifTrue: [minAndNat first x] ifFalse: [minAndNat first y]. isVertical ifTrue: [minAndNat second x] ifFalse: [minAndNat second y]}