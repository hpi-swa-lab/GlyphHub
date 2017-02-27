as yet unclassified
setupDataFor: aWidget
	| spacing |
	vertical := aWidget vertical.
	spacing := aWidget submorphCount - 1 * aWidget spacing.
	expand := {false. false}.
	hasHeightForWidth := false.
	expanderCount := 0.
	totalMin := totalNat := spacing.
	nonLayoutDirectionSizes := {0. 0}.
	
	childItems := aWidget submorphs collect: [ :child | | item nonLayoutDirectionSizesChild |
		item := BTBoxLayoutItem new widget: child.
		nonLayoutDirectionSizesChild := item updateInDirection: aWidget vertical.
		
		hasHeightForWidth := hasHeightForWidth or: [child hasHeightForWidth].
		item expanding ifTrue: [expanderCount := expanderCount + 1].
		
		(expand first and: [expand second]) ifFalse: [ | childExpand |
			childExpand := child wantsExpandIn: vertical.
			expand := {expand first or: [childExpand first]. expand second or: [childExpand second]} ].
		
		totalMin := totalMin + item minSize.
		totalNat := totalNat + item naturalSize.
		nonLayoutDirectionSizes at: 1 put: ((nonLayoutDirectionSizes at: 1) max: nonLayoutDirectionSizesChild first).
		nonLayoutDirectionSizes at: 2 put: ((nonLayoutDirectionSizes at: 2) max: nonLayoutDirectionSizesChild second).
		item ]