loading
updateCloseButton: aThread

	aThread closed
		ifFalse: [
			closeButton
				text: (BTIcon icon: #check), ' Close Thread';
				colorType: #success]
		 ifTrue: [
			closeButton
				text: 'Re-Open Thread';
				colorType: #warning]