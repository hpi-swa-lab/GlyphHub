mock-data
fileUploadFor: aModel

	^ fileUploads at: aModel class modelName, '/', aModel id asString