as yet unclassified
testLoadFile
	self
		assert: font glyphContents notNil;
		assert: font fontinfo notNil;
		assert: font metainfo notNil