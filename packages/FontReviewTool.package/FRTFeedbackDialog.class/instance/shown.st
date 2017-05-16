lifecycle
shown

	| button |
	form := self parentTopLevel imageForm.
	applicationScreenshot := (BTImage form: form)
		scalingMode: #fixed;
		expand: true;
		align: #(center center).
	
	applicationScreenshot minSize: 300 @ (applicationScreenshot heightAtWidth: 300).
	
	button := BTClickable new
		add: applicationScreenshot;
		align: #(fill center);
		when: #clicked send: #openSketchEditor to: self.
		
	page add: button at: 1