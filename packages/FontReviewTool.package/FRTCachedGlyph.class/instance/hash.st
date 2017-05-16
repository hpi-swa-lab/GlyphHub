as yet unclassified
hash

	^ (self versionHash hash bitXor: self font id hash) bitXor: self glyphName hash