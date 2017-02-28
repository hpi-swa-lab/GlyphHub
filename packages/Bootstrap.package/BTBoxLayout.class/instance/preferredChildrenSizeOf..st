as yet unclassified
preferredChildrenSizeOf: aWidget
	| min nat |
	self setupDataFor: aWidget.
	
	min := self flipPoint: totalMin @ nonLayoutDirectionSizes first.	
	nat := self flipPoint: totalNat @ nonLayoutDirectionSizes second.
	
	hasHeightForWidth ifTrue: [
		Transcript show: (self heightForWidth: nat x in: aWidget); cr.
		nat := nat x @ (self heightForWidth: nat x in: aWidget) first ].
	
	^{min. nat}