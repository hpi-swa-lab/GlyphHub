baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [
		spec
			package: 'Bootstrap';
			package: 'Bootstrap-Tests' with: [spec requires: #('default')];
			
			group: 'default' with: #('Bootstrap');
			group: 'Tests' with: #('Bootstrap-Tests')]