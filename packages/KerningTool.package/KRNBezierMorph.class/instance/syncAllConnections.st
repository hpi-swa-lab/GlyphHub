event handling
syncAllConnections
	self pointMorphs do: [ :p | self syncConnections: {p. 0 @ 0}  ]