running
setUpForDefaultFamily
	"default family does not have a sample text"

	family := self mockFamily.
	self setUpForPage: FRTFontPage new with: family defaultFont prepare: [:topLevel | topLevel addEntity: family]