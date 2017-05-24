testing
testDisplaysAllComments

	(self expect: page) to haveText: 'comment text'.
	(self expect: page) to haveText: 'second comment text'.
	(self expect: page) to haveText: 'third comment text'