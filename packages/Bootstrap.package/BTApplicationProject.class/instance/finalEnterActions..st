enter
finalEnterActions: leavingProject
	super finalEnterActions: leavingProject.
	
	self app openInWorld.
	self resizeApp.
	
	TheWorldMainDockingBar showWorldMainDockingBar: false.
	Preferences disable: #showSharedFlaps