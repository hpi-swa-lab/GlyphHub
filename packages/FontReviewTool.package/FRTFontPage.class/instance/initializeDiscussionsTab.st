initialize-release
initializeDiscussionsTab

	showClosedThreadsCheckbox := (BTCheckboxWithLabel label: 'Show closed threads').
	showClosedThreadsCheckbox check
		when: #toggled
		send: #updateThreadsContainer
		to: self.
	threadsContainer := BTPage column
		expand: true.
	
	^ discussionsTab := BTPage column
		add: showClosedThreadsCheckbox;
		add: threadsContainer