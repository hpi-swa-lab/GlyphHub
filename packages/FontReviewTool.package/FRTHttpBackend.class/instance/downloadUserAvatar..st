image-download
downloadUserAvatar: aUserOrId
	"this function ignores the cache. We do not care what comes from the server, but return a form-promise."

	| id |
	id := aUserOrId isBTModel ifTrue: [aUserOrId id] ifFalse: [aUserOrId].
	^ (self request: '/user_avatar/', id method: 'GET' data: '' contentType: 'image/jpeg')
			then: [:response | | document |
				document := MIMEDocument contentType: response contentType 
					content: (response contentWithProgress: nil) url: 'file.jpg'.
				Form fromBinaryStream: document contentStream]