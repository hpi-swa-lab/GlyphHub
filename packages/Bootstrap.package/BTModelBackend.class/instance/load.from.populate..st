operations
load: aNumber from: aTableNameString populate: aCollection
	^self
		loadFrom: aTableNameString
		where: #id
		equals: aNumber
		into: self
		populate: aCollection