event handling
close
	closed ifFalse: [
		self
			closed: true;
			addSmoothSegmentFrom: self lastSubmorph endPoint to: self firstSubmorph startPoint ]