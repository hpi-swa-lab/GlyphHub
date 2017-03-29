running
setUp
	| port |
	super setUp.
	server := FRTFakeRestServer new.
	port := server open.
	loginPage := FRTLoginPage new.
	application := FRTApplication firstPage: loginPage.
	application backend apiRootUrl: 'http://localhost:', port asString, '/'