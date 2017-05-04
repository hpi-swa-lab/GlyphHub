examples
loadExample

	| backend |
	backend := FRTHttpBackend new.
	^ (backend login: 'Eva' password: 'eveisevil') then: [backend]
	