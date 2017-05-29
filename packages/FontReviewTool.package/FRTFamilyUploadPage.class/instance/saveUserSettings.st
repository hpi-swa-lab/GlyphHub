operations
saveUserSettings
	
	^ self topLevel user biography ~= biographyText text
		ifTrue: [
			self topLevel user
				biography: biographyText text;
				save]
		ifFalse: [BTPromise unit: true]