accessing
openCopyInDialogLabelled: aString

	^ (BTDialog title: aString)
		add: (self copy
			align: #(center center);
			expand: true;
			hasFrame: false;
			scalingMode: #shrink);
		extent: (form extent min: 600 asPoint);
		openCentered