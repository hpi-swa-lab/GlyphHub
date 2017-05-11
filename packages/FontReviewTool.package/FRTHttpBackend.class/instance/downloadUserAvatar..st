font-upload
downloadUserAvatar: aUserOrId
	"this function ignores the cache"

	| id directory filename |
	id := aUserOrId isBTModel ifTrue: [aUserOrId id] ifFalse: [aUserOrId].
	
	filename := id asString, '.jpg'.
	directory := FRTUser customAvatarDefaultDirectory.
	directory assureExistence.
	
	^ (self request: '/user_avatar/', id method: 'GET' data: '' contentType: 'image/jpeg')
			then: [:response |
				directory forceNewFileNamed: filename do: [:stream | stream binary; nextPutAll: response content].
				filename]