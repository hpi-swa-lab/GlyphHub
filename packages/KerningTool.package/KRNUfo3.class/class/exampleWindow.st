as yet unclassified
exampleWindow
	| container font |

	container := BorderedMorph new
		extent: 1200@500;
		layoutInset: 10;
		color: Color white;
		layoutPolicy: (KRNParagraphLayout new lineHeight: 1.1; yourself);
		vResizing: #shrinkWrap
		yourself.

	font := self openBaskerville.
	'P. Onlarm gre ciand lics— of nual Knowne (e. We beent the of som thespol instait? Whatha physion, 1996 Manera for go comatio set outudy in ths th syst rexes, Reates Vical any of tork ismisuch andurre fors, conifer Amet - angto rowere al, wilien, hatual ings. Rus bonly), ishish eciatri th reas Ave, yourpri of hemble. Fre of ancrid, as wition new prapic mille. The ind int reatep ing Eack antrec, st yess ex and yoully fundis astrop its toomple forrit de) Forn was by res selt stal Minfla voulap he peur angrack istrad sam anzelic und a grecup ricat cospon 16 Mrsivoin cappon they indin He whicon' do: [ :char | container addMorph: ((font createGlyphFor: char ptSize: 64) color: Color black; yourself) ].

	container openInHand