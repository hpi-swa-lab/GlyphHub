initialize-release
initializeHeadingArea

	userAvatarImage := BTImage new
		minSize: 66 asPoint;
		scalingMode: #fixed;
		yourself.
	usernameLabel := BTLabel new
		align: #(start center);
		heading.

	^ BTPage row
		add: userAvatarImage;
		add: usernameLabel;
		yourself