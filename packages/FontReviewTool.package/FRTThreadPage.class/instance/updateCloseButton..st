updating
updateCloseButton: aThread

	aThread closed
		ifFalse: [
			closeButton
				text: (BTIcon icon: #check), ' Close Thread';
				colorType: #success]
		 ifTrue: [
			closeButton
				text: 'Re-Open Thread';
				colorType: #warning].

	closeButton visible: (aThread author id = aThread font author id or: [self topLevel user id = aThread author id])