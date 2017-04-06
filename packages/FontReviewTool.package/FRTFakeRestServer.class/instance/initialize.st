initialize-release
initialize
	userTable := Json readFrom: '{"_items":[{"_created":"Tue,28Mar201709:23:21GMT","_id":1,"_updated":"Tue,28Mar201709:23:21GMT","password":"eveisevil","username":"Eva"},{"_created":"Tue,28Mar201709:23:21GMT","_id":2,"_updated":"Tue,28Mar201709:23:21GMT","password":"safepwissafe","username":"Tom"}],"_meta":{"max_results":25,"page":1,"total":2}}' readStream.
	
	fontTable := Json readFrom: '{"_items":[{"_created":"Tue,28Mar201709:23:21GMT","_id":1,"_updated":"Tue,28Mar201709:23:21GMT","author_id":1,"family_id":1,"fontName":"FiraSansRegular"}],"_meta":{"max_results":25,"page":1,"total":1}}' readStream.
	
	familyReply := '{"_created":"Thu,30Mar201715:09:22GMT","_id":1,"_updated":"Thu,30Mar201715:09:22GMT","family_name":"Fira","fonts":[{"_created":"Thu,30Mar201715:09:22GMT","_id":1,"_updated":"Thu,30Mar201715:09:22GMT","author_id":1,"family_id":1,"font_name":"FiraSansRegular","path":"../martel/DevanagariMasters_still_in_development/MartelDevanagari-Regular.ufo"},{"_created":"Thu,30Mar201715:09:22GMT","_id":2,"_updated":"Thu,30Mar201715:09:22GMT","author_id":1,"family_id":1,"font_name":"FiraSansBold","path":"../martel/DevanagariMasters_still_in_development/MartelDevanagari-Regular.ufo"}]}'.
	
	commentReply := '{"_created":"Thu,30Mar201715:09:22GMT","_id":1,"_updated":"Thu,30Mar201715:09:22GMT","author":{"_created":"Thu,30Mar201715:09:22GMT","_id":2,"_updated":"Thu,30Mar201715:09:22GMT","password":"safepwissafe","user_name":"Tom"},"author_id":2,"text":"whywouldanyonecommentonaas","thread_id":1}'