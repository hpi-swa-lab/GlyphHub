baseline
baseline: spec

	<baseline>
	
	spec
		for: #'common'
	do: [
		spec
			package: 'KerningTool';
			package: 'KerningTool-Tests' with: [ spec requires: #('default') ].
		spec
			group: 'default' with: #('KerningTool');
			group: 'Tests' with: #('KerningTool-Tests') ]