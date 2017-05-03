accessing
fontNameForPango
	"Our pango plug-in does not work with -, eg roboto-bold, so replace it with space, eg roboto bold"

	^ self fontName replaceAll: $- with: $ 