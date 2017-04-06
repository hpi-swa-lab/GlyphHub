operations
sortedBy: aFieldName

	^ self sorted: [:model1 :model2 | (model1 get: aFieldName) < (model2 get: aFieldName)]