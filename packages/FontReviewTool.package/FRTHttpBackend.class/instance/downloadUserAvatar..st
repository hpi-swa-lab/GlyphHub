font-upload
downloadUserAvatar: aUserOrId
	"this function ignores the cache"

	| id |
	id := aUserOrId isBTModel ifTrue: [aUserOrId id] ifFalse: [aUserOrId].
	
	^ (self request: '/user_avatar/', id method: 'GET' data: '' contentType: 'image/jpeg')
			then: [:response |
				ImageReadWriter formFromStream: response stream]