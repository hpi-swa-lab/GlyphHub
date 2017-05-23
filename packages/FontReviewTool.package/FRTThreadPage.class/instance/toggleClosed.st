callbacks
toggleClosed

	^ ((self thread
		closed: self thread closed not;
		save)
		then: [
			self thread closed
				ifTrue: [self topLevel openPage: FRTFontPage new with: self thread font]
				ifFalse: [self updateCloseButton: self thread]])
		catch: [
			closeButton disabled: false.
			self topLevel displayNotification: 'Closing thread failed.' type: #danger]