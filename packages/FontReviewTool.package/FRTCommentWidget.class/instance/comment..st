accessing
comment: aComment
	
	comment := aComment.
	
	metaInfo text: aComment author username", ' - ', (self printDate: aComment created)".
	commentText text: aComment text.
	userAvatar path: aComment author avatarPath.
	
	comment attachments do: [:attachment |
		image := attachment asWidget
			align: #(end end);
			scalingMode: #shrink.
		
		self add: (BTClickable new
			expand: true;
			when: #clicked send: #openCopyInDialog to: image;
			add: image)]