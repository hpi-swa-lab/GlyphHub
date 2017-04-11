baseline
baseline: spec

	<baseline>
	
	spec for: #'common' do: [
		spec
			package: 'KerningTool';
			package: 'KerningTool-Tests' with: [spec requires: #('default')];
			
			group: 'default' with: #('KerningTool');
			group: 'tests' with: #('KerningTool-Tests')]