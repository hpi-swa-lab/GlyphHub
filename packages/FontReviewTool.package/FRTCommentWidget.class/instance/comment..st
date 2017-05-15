accessing
comment: aComment
	
	comment := aComment.
	
	metaInfo text: aComment author username, ' - ', (self printDate: aComment createdAt).
	commentText text: aComment text.
	aComment author downloadAvatarForm then: [:form | userAvatar form: form].
	
	comment attachments do: [:attachment |
		image := attachment asWidget
			align: #(end end);
			scalingMode: #shrink.
		
		self add: (BTClickable new
			expand: true;
			when: #clicked send: #openCopyInDialog to: image;
			add: image)]