layout
heightForWidth: aNumber
	" return minimum and natural height for the given width. feel free to override this function! "
	^(self hasHeightForWidth and: [self layoutPolicy notNil])
		ifTrue: [self layoutPolicy heightForWidth: aNumber in: self]
		ifFalse: [self preferredSize collect: [ :s | s y ]]