baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [
		spec baseline: 'Bootstrap' with: [spec repository: 'github://HPI-SWA-Lab/BP2016H1:master/packages'].
		spec baseline: 'KerningTool' with: [spec repository: 'github://HPI-SWA-Lab/BP2016H1:master/packages'].
		
		spec
			package: 'FontReviewTool';
			
			group: 'default' with: #('FontReviewTool');
			group: 'tests' with: #('FontReviewTool')]