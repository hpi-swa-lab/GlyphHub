initialize-release
initialize

	| padding paddingRectangle |
	super initialize.

	counter := BTBadge new ignoreLayout: true.
	padding := BTWidget spacing / 2.
	paddingRectangle := Rectangle
		left: padding
		right: padding
		top: padding + BTWidget spacing * 1.2
		bottom: padding.
	self
		withLayout;
		vertical: true;
		padding: paddingRectangle;
		commentCount: 0