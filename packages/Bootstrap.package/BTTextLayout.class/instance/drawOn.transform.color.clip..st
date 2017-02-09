as yet unclassified
drawOn: aForm transform: aTransform color: aColor clip: aRectangle
	"Transcript show: aRectangle; show: ' '; show: aTransform; cr."
	self
		primLayoutRender: self layout
		form: aForm
		origin: aTransform asMatrixTransform2x3
		color: (aColor pixelWordForDepth: 32)
		clipX: aRectangle origin x asFloat
		clipY: aRectangle origin y asFloat
		clipWidth: aRectangle width asFloat
		clipHeight: aRectangle height asFloat