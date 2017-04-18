updating
displayFamily: aFamily

	^ aFamily fonts anySatisfy: [:font | font author id = self topLevel user id]