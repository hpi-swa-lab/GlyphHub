load-by
nonAssociationFields

	| associations |
	associations := self associations.
	^ self instVarNames reject: [:field | associations includesKey: field]