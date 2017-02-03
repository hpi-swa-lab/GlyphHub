as yet unclassified
renderTest
	| form |
	form := Form fromDisplay: (0@0 extent: 200@200).
	layout := 0.
	layout := self primRenderLayout: layout bitmap: form string: 'Das ist ein Test!' fontSize: 16 dpi: 96 * 2 fontName: 'Roboto' origin: 5.0 @ 5.0 color: (Color white pixelWordForDepth: 32).
	self primLayout: layout heightForWidth: 200.
	self primRenderLayout: layout bitmap: form string: 'Das ist ein Test!' fontSize: 16 dpi: 96 * 2 fontName: 'Roboto' origin: 5 @ 10 color: (Color white pixelWordForDepth: 32).
	form displayOn: Display at: 200 @ 50.