accessing
updateMetrics
	| metrics |
	metrics := HbFt primGetFontMetricsFor: self familyName fontSize: self pointSize dpi: 92 * 2.
	ascent := metrics first.
	descent := metrics second.
	height := metrics third.
	maxAdvance := metrics fourth