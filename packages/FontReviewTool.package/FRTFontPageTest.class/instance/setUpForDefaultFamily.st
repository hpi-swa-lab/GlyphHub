running
setUpForDefaultFamily
	"default family does not have a sample text"

	family := self mockFamily.
	font := family defaultFont.
	otherUser := self mockUserOther.
	self setUpForPage: FRTFontPage new with: font prepare: [:topLevel |
		topLevel
			addEntity: otherUser;
			addEntity: family]