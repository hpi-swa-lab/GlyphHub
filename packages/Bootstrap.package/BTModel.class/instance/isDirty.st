testing
isDirty

	self hasDirtyFields ifTrue: [^ true].

	querying := true.
	
	[dirtyFlags with: self class instVarNames do: [:dirty :field | | data |
		dirty ifTrue: [^ true].
		
		data := self instVarNamed: field.
		((data isBTModel or: [data isBTModelList]) and: [data querying not]) ifTrue: [
			data isDirty ifTrue: [^ true]]]] ensure: [querying := false].
	^ false