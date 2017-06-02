accessing
apiRootUrl

	^ apiRootUrl ifNil: [self class defaultApiRoolUrl]