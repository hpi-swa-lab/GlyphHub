running
setUpForDefaultFamily
	"default family does not have a sample text"

	family := self mockFamily.
	font := family defaultFont.
	self setUpForPage: FRTFontPage new with: font prepare: [:topLevel | topLevel addEntity: family]