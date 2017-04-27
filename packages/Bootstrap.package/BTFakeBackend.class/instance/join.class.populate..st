as yet unclassified
join: aModelList class: aClass populate: aCollection

	| associations populate |
	associations := aClass associations.
	populate := aCollection == #all
		ifTrue: [ associations keys ]
		ifFalse: [ aCollection ].
	
	aModelList do: [ :model |
		populate do: [ :field | | current association children |
			current := model instVarNamed: field.
			association := associations at: field.
			
			children := self
				loadWhere: ((association foreignClass associations at: association backPopulateKey ifAbsent: [#single]) cardinality == #many ifTrue: ['id'] ifFalse: [association backPopulateKey])
				equals: (association cardinality == #single ifTrue: [current] ifFalse: [model id])
				into: association foreignClass
				populate: #().
			
			children value do: [ :childModel | childModel instVarNamed: association backPopulateKey put: model ].
			
			model
				instVarNamed: field
				put: (association cardinality == #single
					ifTrue: [children value ifEmpty: [nil] ifNotEmptyDo: #onlyElement]
					ifFalse: [
						children value
							field: field;
							owner: model;
							yourself ]) ]]