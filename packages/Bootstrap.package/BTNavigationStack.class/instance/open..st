navigation
open: aPage
	current ~= stack size ifTrue: [ | outdated |
		outdated := stack size - current.
		outdated > 0 ifTrue: [
			(stack removeLast: outdated) do: [ :page | page removed ]]].
	
	stack add: aPage.
	self current: stack size.
	
	^aPage