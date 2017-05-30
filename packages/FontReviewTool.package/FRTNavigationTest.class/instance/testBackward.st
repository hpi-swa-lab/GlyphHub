tests
testBackward
	
	| app page1 page2 |
	page1 := BTApplicationPage new.
	page2 := BTApplicationPage new.
	app := FRTApplication firstPage: page1.
	
	app openPage: page2.
	(self expect: app openPage) to be: page2.
	app navigationStack goBack.
	(self expect: app openPage) to be: page1