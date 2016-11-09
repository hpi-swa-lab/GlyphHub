initialize-release
horizontalLineAt: y on: aCanvas
	| origin |
	origin := self bounds topLeft + (0 @ y).
	aCanvas line:  origin to: origin + (self width @ 0) width: 1 color: Color gray