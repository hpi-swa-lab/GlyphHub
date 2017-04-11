baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [
		spec
			package: 'FontReviewTool';
			package: 'FontReviewTool-Models';
			package: 'FontReviewTool-Tests' with: [spec requires: #('default')];
			
			group: 'default' with: #('FontReviewTool' 'FontReviewTool-Models');
			group: 'Tests' with: #('FontReviewTool-Tests')]