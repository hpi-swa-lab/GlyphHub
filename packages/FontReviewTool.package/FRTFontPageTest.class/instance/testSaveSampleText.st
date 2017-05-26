testing
testSaveSampleText

	| sampleTextEditor sampleTextSavePromise familyLoadPromise |
	self setUpForDefaultFamily.
	self topLevel user: family defaultFont author.
	self enterPage.
	
	sampleTextEditor := page overviewTab sampleTextEditor.
	sampleTextEditor fromJsonString: self mockSampleTextJson.
	sampleTextSavePromise := page overviewTab saveSampleText: sampleTextEditor richText.
	(self expect: sampleTextSavePromise) to resolve.

	familyLoadPromise := FRTFamily load: family id populate: #('standardSampleText' 'standardSampleText.author') from: self topLevel.
	(self expect: familyLoadPromise) to resolve.  self flag: #TODO. "make a better equality check for BTModels"
	(self expect: familyLoadPromise value standardSampleText id) to equal: sampleTextSavePromise value id