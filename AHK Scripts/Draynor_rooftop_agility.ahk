1::
;
;   You must be in fullscreen, 1080p monitor, starting at zoom level shown in pic, and start on the tile marked in the pic.
;   https://gyazo.com/235bb01cf7930f1d298e04c9f3c40d6a
;  Written by ChillX#1558
;
;
loop {

;Random Variable Declarations

	;compass
	Random, CompassX, 1715, 1735
	Random, CompassY, 30, 55

	;sleeps
	Random, s1, 1500, 2500
	Random, s2, 50, 150
	Random, O1s, 10500, 11250
	Random, O2s, 10000, 11000
	Random, O3s, 9750, 10500
	Random, O4s, 5750, 6500
	Random, O5s, 5250, 6000
	Random, O6s, 5750, 6500
	Random, O7s, 7100, 8000

	;locations
	Random, O1x, 935, 941
	Random, O1y, 176, 188
	Random, O2x, 723, 754
	Random, O2y, 604, 634
	Random, O3x, 1023, 1066
	Random, O3y, 541, 566
	Random, O4x, 754, 792
	Random, O4y, 656, 693
	Random, O5x, 908, 957
	Random, O5y, 740, 789
	Random, O6x, 1314, 1381
	Random, O6y, 505, 580
	Random, O7x, 1182, 1253
	Random, O7y, 243, 384
	Random, F1x, 1878, 1882
	Random, F1y, 654, 655
	Random, F1x2, 988, 1033
	Random, F1y2, 580, 608

;Script Start
StartScript:

	Mousemove, CompassX, CompassY, 9
	sleep s2
	click
	sleep s2
	
	Mousemove, O1x, O1y, 9
	sleep s2
	click
	sleep O1s
	
	Mousemove, O2x, O2y, 9
	sleep s2
	click
	sleep O2s
	
	Mousemove, O3x, O3y, 9
	sleep s2
	click
	sleep O3s
	
	Mousemove, O4x, O4y, 9
	sleep s2
	click
	sleep O4s
	
	PixelSearch, Px, Py, 475, 750, 650, 950, 158BA2, 2, Fast
	sleep 50
	if (ErrorLevel = !0)
	{
		Mousemove, CompassX, CompassY, 9
		sleep s2
		click
		sleep s2
		Mousemove, F1x, F1y, 9
		sleep s2
		click
		sleep O1s
		Mousemove, F1x2, F1y2, 9
		sleep s2
		click
		sleep s1
		Goto StartScript
	}
	
	else
	{
		Goto Continue
	}
	
	Continue:
	
	Mousemove, O5x, O5y, 9
	sleep s2
	click
	sleep O5s
	
	Mousemove, O6x, O6y, 9
	sleep s2
	click
	sleep O6s
	
	Mousemove, O7x, O7y, 9
	sleep s2
	click
	sleep O7s
	
}


2::reload
3::exitapp
