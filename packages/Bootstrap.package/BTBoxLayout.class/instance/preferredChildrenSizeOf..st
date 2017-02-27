as yet unclassified
preferredChildrenSizeOf: aWidget
	self setupDataFor: aWidget.
	
	^{self flipPoint: totalMin @ nonLayoutDirectionSizes first. self flipPoint: totalNat @ nonLayoutDirectionSizes second}