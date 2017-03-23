displaying
openPositionFor: aWidget
	^aWidget bounds bottomCenter - ((self extent x / 2) @ self targetOffset negated)