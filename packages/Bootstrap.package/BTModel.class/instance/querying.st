accessing
querying
	" answer whether there is currently a query being performed on me. this is here to break cycles, e.g.
	
	  Penguin asks its Beak whether it's valid.
	  To answer that, Beak asks its Penguin whether it's valid.
	  Since Penguin sets its `querying` attribute to true before it asks the Beak, Beak knows not to ask Penguin "
	
	^ querying