as yet unclassified
testOneActiveTabAtATime
	| navigation topLevel |
	navigation := BTNavigation new.
	#('First' 'Second' 'None') do: [ :text |
		navigation add: (BTTab new add: (BTLabel text: text) ) ].

	topLevel := self verticalTopLevel add: navigation.
	
	navigation submorphsDo: [:each | self assert: each active not ].
	
	navigation makeActive: navigation firstSubmorph.
	navigation submorphs third triggerEvent: #clicked with: nil.
	
	self
		assert: navigation submorphs first active not;
		assert: navigation submorphs second active not;
		assert: navigation submorphs third active
		
	