running
setUp
	| port |
	super setUp.
	server := FRTFakeRestServer new.
	port := server open.
	backend := BTHttpModelBackend new apiRootUrl: 'http://localhost:', port asString, '/'