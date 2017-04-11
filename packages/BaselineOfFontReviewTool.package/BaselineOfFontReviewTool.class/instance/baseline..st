baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [
		spec baseline: 'Bootstrap' with: [spec repository: 'github://HPI-SWA-Lab/BP2016H1:master/packages'].
		spec baseline: 'KerningTool' with: [spec repository: 'github://HPI-SWA-Lab/BP2016H1:master/packages'].
		
		spec
			package: 'FontReviewTool';
			package: 'FontReviewTool-Models';
			package: 'FontReviewTool-Tests' with: [spec requires: #('default')];
			
			group: 'default' with: #('FontReviewTool' 'FontReviewTool-Models');
			group: 'tests' with: #('FontReviewTool-Tests')]