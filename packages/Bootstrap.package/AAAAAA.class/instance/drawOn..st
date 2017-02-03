as yet unclassified
drawOn: aCanvas
	"BTWidget drawBackgroundOn: aCanvas bounds: self bounds colors: ({#border -> Color red. #background -> Color green} as: Dictionary) rounded: {false.true.true.false} bordered: {true. true. true. false}."

	BTWidget drawBackgroundOn: aCanvas bounds: self bounds colors: ({#border -> Color red. #background -> Color green} as: Dictionary) rounded: {true.false.false.true} bordered: {true. false. true. true}