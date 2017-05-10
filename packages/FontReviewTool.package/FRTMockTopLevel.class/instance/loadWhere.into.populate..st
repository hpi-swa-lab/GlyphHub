operations
loadWhere: anAssociationList into: aClass populate: aCollection
	
	^ self resolveWith: (entities
		select: [:entity |
			entity class = aClass and: [anAssociationList allSatisfy: [:association | | value left right |
				value := entity perform: association key.
				left := value isBTModel ifTrue: [value id] ifFalse: [value].
				right := association value isBTModel ifTrue: [association value id] ifFalse: [association value].
				left = right]]]) populate: aCollection