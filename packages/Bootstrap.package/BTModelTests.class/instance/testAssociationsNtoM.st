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
		(self expect: private favoritePubs) to contain: {iceFloe}.
		(self expect: rico favoritePubs) to contain: {iceFloe. freezingIcebear}.
		(self expect: paula favoritePubs) to contain: {freezingIcebear}.
		(self expect: iceFloe penguins) to contain: {rico. private}.
		(self expect: freezingIcebear penguins) to contain: {rico. paula} ].

	assertions value.
	
	" test if associations are persisted 
	FIXME: our in-memory backend currently doesnt support n-to-m. for easy of use, we will ignore this fact for now.
	iceFloe saveTo: backend.
	freezingIcebear saveTo: backend.

	iceFloe := (BTPubModel loadBy: #name value: 'The Ice Floe' from: backend) value anyOne.
	freezingIcebear := (BTPubModel loadBy: #name value: 'The Freezing Iceb(e)ar' from: backend) value anyOne.
	
	rico := (BTPenguinModel loadBy: #name value: 'Rico' from: backend) value anyOne.
	paula := (BTPenguinModel loadBy: #name value: 'Paula' from: backend) value anyOne.
	private := (BTPenguinModel loadBy: #name value: 'Private' from: backend) value anyOne.
	
	assertions value "