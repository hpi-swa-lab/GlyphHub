load-by
nonAssociationFields

	| associations |
	associations := self associations.
	^ self fieldNames reject: [:field | associations includesKey: field]