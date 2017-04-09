load-by
loadBy: aField value: anObject populate: aCollection

	^ self
		loadFrom: self defaultBackend
		where: aField
		equals: anObject
		into: self
		populate: aCollection