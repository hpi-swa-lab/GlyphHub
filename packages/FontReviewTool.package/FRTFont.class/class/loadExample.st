accessing
loadExample

	^ FRTHttpBackend loadExample
		then: [:backend | FRTFont load: 1 populate: #() from: backend]