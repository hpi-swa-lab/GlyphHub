as yet unclassified
forParent: aTransformable

	| transformable |
	transformable := self new
		transform: aTransformable transform inverse: aTransformable inverseTransform;
		yourself.
		
	aTransformable addMorphBack: transformable.
	
	^ transformable