accessing
enteringWith: aThreadAndGlyph

	| loadGlyph loadThread populateThread subscriptionDictionary |
	self enteredFromGlyph: aThreadAndGlyph second.
	
	loadGlyph := self enteredFromGlyph
		ifNotNil: [
			(FRTGlyph load: aThreadAndGlyph second id populate: #( 'font' 'font.family') from: self backend)
				then: [:newGlyph | self enteredFromGlyph: newGlyph]]
		ifNil: [BTPromise unit: nil].
	
	populateThread := #(comments  'comments.author' 'comments.attachments' threadGlyphAssociations 'threadGlyphAssociations.glyph' 'threadGlyphAssociations.glyph.font' 'threadGlyphAssociations.glyph.font.family').
	
	loadThread := (FRTThread load: aThreadAndGlyph first id populate: populateThread from: self backend)
		then: [:newThread |
			self thread: newThread.
			title text: 'Thread: ', newThread title.
			preview
				font: newThread threadGlyphAssociations anyOne glyph font;
				glyphNames: (newThread threadGlyphAssociations collect: [:association | association glyph glyphName]).
			self
				displayComments;
				changed.
			subscriptionDictionary := Dictionary new
				at: 'thread_id' put: newThread id;
				at: 'user_id' put: self user id;
				yourself.
			((FRTThreadSubscription
				loadWhere: subscriptionDictionary from: self backend)
				then: [:subscriptionList |
					subscriptionList
						ifNotEmpty: [self subscription: subscriptionList anyOne]
						ifEmpty: [self subscription: (FRTThreadSubscription new user: self user; thread: newThread)].
						self updateSubscriptionState])].

	^ BTPromise all: {loadGlyph. loadThread}