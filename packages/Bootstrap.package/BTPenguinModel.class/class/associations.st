as yet unclassified
associations
	^{
		#eggs -> {BTEggModel. #parent. #many}.
		#significantOther -> {BTPenguinModel. #significantOther. #single}.
		#beak -> {BTBeakModel. nil. #single}.
		#favoritePubs -> {BTPubModel. #penguins. #many}
	} as: Dictionary