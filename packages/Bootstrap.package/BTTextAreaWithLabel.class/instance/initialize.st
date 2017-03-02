as yet unclassified
initialize 
	super initialize.
	
	"set default text in case someone forgets to set text"
	label := BTLabel bold: 'No Text Set'.
	textArea := BTTextArea new.
	
	self
		withLayout;
		spacing: BTWidget spacing / 2;  
		vertical: true;
		add: label;
		add: textArea;
		yourself