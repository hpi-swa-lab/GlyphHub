as yet unclassified
findKerningBetweenName: first and: second
	| groupsFirst groupsSecond firstGroup |
	" resolve kerning precendence "
	kerning ifNil: [ ^0 ].

	groupsFirst := self groupsContaining: first select: [ :name | kerning includesKey: name ].
	groupsSecond := self groupsContaining: second.

	kerning at: first ifPresent: [ :entry |
		" glyph -> glyph "
		entry at: second ifPresent: [ :value | ^value ].
		" glyph -> group "
		groupsSecond do: [ :groupName |
			entry at: groupName ifPresent: [ :value | ^value ]]].
	
	" group -> glyph "
	groupsFirst do: [ :groupName |
		(kerning at: groupName) at: second ifPresent: [ :value | ^value ]].
	
	" group -> group "
	groupsFirst do: [ :firstGroupName |
		firstGroup := kerning at: firstGroupName.
		groupsSecond do: [ :secondGroupName |
			firstGroup at: secondGroupName ifPresent: [ :value | ^value ]]].

	^0