font-upload
downloadUserAvatar: aUserOrId

	| id directory filename |
	id := aUserOrId isBTModel ifTrue: [aUserOrId id] ifFalse: [aUserOrId].
	
	filename := id asString, '.jpg'.
	directory := FRTUser customAvatarDefaultDirectoty.
	directory assureExistence.
	
	^ (directory fileExists: filename)
		ifTrue: [BTPromise unit: filename]
		ifFalse: [
			(self request: '/user_avatar/', id method: 'GET' data: '' contentType: 'image/jpeg')
				then: [:response |
					directory forceNewFileNamed: filename do: [:stream | stream binary; nextPutAll: response content].
					filename]]