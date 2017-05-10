accessing
comment: aComment
	
	comment := aComment.
	
	metaInfo text: aComment author username", ' - ', (self printDate: aComment created)".
	commentText text: aComment text.
	aComment author avatarPath then: [:path | userAvatar path: path].
	
	comment attachments do: [:attachment |
		image := attachment asWidget
			align: #(end end);
			scalingMode: #shrink.
		
		self add: (BTClickable new
			expand: true;
			when: #clicked send: #openCopyInDialog to: image;
			add: image)]