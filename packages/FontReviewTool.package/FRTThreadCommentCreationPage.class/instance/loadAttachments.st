callbacks
loadAttachments
	
	^ (FRTAttachment
		loadWhere: ({'comment_id' -> nil. 'owner_id' -> self topLevel user} as: Dictionary)
		populate: #()
		from: self backend)
		then: [:attachments |
			imageAttachments addAll: (attachments collect: [:attachment |
				BTImage new
					load: '/attachment/', attachment id, '/resource' from: self backend; 
					minSize: 128])].