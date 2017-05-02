callbacks
saveAttachmentTo: aComment

	^ self attachment
		ifNil: [BTPromise unit: aComment]
		ifNotNil: [self backend uploadForm: self attachment toComment: aComment]