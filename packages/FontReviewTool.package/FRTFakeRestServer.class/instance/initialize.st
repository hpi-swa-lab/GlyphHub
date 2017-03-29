initialize-release
initialize
	userTable := Json readFrom: '{"_items":[{"_created":"Tue,28Mar201709:23:21GMT","_id":1,"_updated":"Tue,28Mar201709:23:21GMT","password":"eveisevil","userName":"Eva"},{"_created":"Tue,28Mar201709:23:21GMT","_id":2,"_updated":"Tue,28Mar201709:23:21GMT","password":"safepwissafe","userName":"Tom"}],"_meta":{"max_results":25,"page":1,"total":2}}' readStream.
	
	fontTable := Json readFrom: '{"_items":[{"_created":"Tue,28Mar201709:23:21GMT","_id":1,"_updated":"Tue,28Mar201709:23:21GMT","author_id":1,"family_id":1,"fontName":"FiraSansRegular"}],"_meta":{"max_results":25,"page":1,"total":1}}' readStream