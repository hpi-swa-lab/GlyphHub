callbacks
loadAttachments

	^ (FRTAttachment
		loadWhere: {#comment -> nil. #owner -> self topLevel user}
		populate: #()
		from: self backend)
		then: [:attachments |
			imageAttachments addAll: (attachments collect: [:attachment |
				BTImage new
					load: '/attachment/', attachment id, '/resource' from: self backend; 
					minSize: 128])].