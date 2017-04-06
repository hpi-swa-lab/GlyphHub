as yet unclassified
example

	| app profilePage|
	profilePage := FRTProfilePage new.
	app :=  (FRTApplication firstPage: profilePage).
	app loginExampleUser then: [:a |
		profilePage user: app user.
		app openInWorld]