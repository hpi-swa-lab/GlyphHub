updating
updateUserAvatarImage: aUser
	
	aUser downloadAvatarForm then: [:form | userAvatarImage form: form]