initialize-release
detectHandleTypes
	self submorphs allButLastDo: [ :current | | next type |
		next := current nextSegment.
		type := self detectHandleTypesBetween: current and: next.
		current handleTypeEnd: type ]