as yet unclassified
testAssociationsNtoM
	| freezingIcebear iceFloe paula rico private assertions |
	rico := BTPenguinModel new name: 'Rico'.
	private := BTPenguinModel new name: 'Private'.
	paula := BTPenguinModel new name: 'Paula'.
	
	iceFloe := BTPubModel new name: 'The Ice Floe'.
	freezingIcebear := BTPubModel new name: 'The Freezing Iceb(e)ar'.
	
	iceFloe penguins add: rico; add: private.
	rico favoritePubs add: freezingIcebear.
	paula favoritePubs add: freezingIcebear.
	
	assertions := [
		(self expect: private favoritePubs) to containExactly: {iceFloe}.
		(self expect: rico favoritePubs) to containExactly: {iceFloe. freezingIcebear}.
		(self expect: paula favoritePubs) to containExactly: {iceFloe}.
		(self expect: iceFloe penguins) to containExactly: {rico. private}.
		(self expect: freezingIcebear) to containExactly: {rico. paula} ].

	assertions value.
	
	" test if associations are persisted "
	iceFloe saveTo: backend.
	freezingIcebear saveTo: backend.

	iceFloe := BTPubModel loadBy: #name value: 'The Ice Floe' from: backend.
	freezingIcebear := BTPubModel loadBy: #name value: 'The Freezing Iceb(e)ar' from: backend.
	
	rico := (BTPenguinModel loadBy: #name value: 'Rico' from: backend) value first.
	paula := (BTPenguinModel loadBy: #name value: 'Paula' from: backend) value first.
	private := (BTPenguinModel loadBy: #name value: 'Private' from: backend) value first.
	
	assertions value