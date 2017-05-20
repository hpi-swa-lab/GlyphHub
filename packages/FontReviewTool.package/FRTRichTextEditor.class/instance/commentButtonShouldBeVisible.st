initialize-release
commentButtonShouldBeVisible

	^ (self richText selectedParagraph notNil) and: [self richText selectedParagraph fontId ~= 0]