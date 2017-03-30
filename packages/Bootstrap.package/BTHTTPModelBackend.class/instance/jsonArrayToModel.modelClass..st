private
jsonArrayToModel: anArray modelClass: aClass
	^(anArray collect: [ :item |
		self jsonObjectToModel: item modelClass: aClass ]) as: BTModelList