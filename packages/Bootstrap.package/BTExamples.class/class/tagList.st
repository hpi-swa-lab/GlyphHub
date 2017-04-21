examples
tagList

	^ BTTopLevel new
		add: (BTWritableTagList new tags: {'First Tag'. 'Second Tag'} asOrderedCollection);
		add: (BTTagList new tags: {'First Tag'. 'Second Tag'} asOrderedCollection)