baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [
		spec package: 'JSON' with: [spec repository: 'http://www.squeaksource.com/JSON'].
		
		spec
			package: 'Bootstrap' with: [spec requires: #('JSON')];
			
			group: 'default' with: #('Bootstrap');
			group: 'tests' with: #('Bootstrap')]