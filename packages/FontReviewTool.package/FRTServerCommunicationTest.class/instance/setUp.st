running
setUp
	| port |
	super setUp.
	server := FRTFakeRestServer new.
	port := server open.
	backend := BTHTTPModelBackend new apiRootUrl: 'http://localhost:', port asString, '/'