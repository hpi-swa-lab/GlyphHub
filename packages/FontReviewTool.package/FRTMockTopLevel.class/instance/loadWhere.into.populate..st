operations
loadWhere: anAssociationList into: aClass populate: aCollection

	| associations |
	associations := aClass associations.
	
	^ self resolveWith: ((entities
		select: [:entity |
			(entity class = aClass and: [
				anAssociationList allSatisfy: [:association | | value |
					value := entity perform: association key.
					(value isBTModel ifTrue: [value id] ifFalse: [value]) = (association value isBTModel ifTrue: [association value id] ifFalse: [association value])]])]) veryDeepCopy as: BTModelList)