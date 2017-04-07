private
startLoadingOperation
	
	loadingOperationCounter = 0 ifTrue: [self loadingWidget show].
	loadingOperationCounter := loadingOperationCounter + 1