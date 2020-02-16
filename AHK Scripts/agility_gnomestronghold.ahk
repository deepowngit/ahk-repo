#Include RandomBezier.ahk
numpad1::
SetTimer, ForceExitApp, 20700000 ; 5 HOURS 45 MINS
Start:
Loop
{
PixelSearch, x, y, 254, 204, 271, 223, 0x034C31, 1, Fast
if ErrorLevel
{
	Send {esc}
	Random, rand, 500, 1500
	Sleep %rand%
	Random, xlog, 636, 651
	Random, ylog, 498, 517
	Random, xspeedlog, 5, 10
	MouseMove %xlog%, %ylog%, %xspeedlog%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, xlog1, 582, 702
	Random, ylog1, 450, 463
	Random, xspeedlog1, 5, 10
	MouseMove %xlog1%, %ylog1%, %xspeedlog1%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	ExitApp
}
else
	{
	Click
	Random, rand, 5500, 6500
	Sleep %rand%
	Random, xstep, 245, 262
	Random, ystep, 251, 256
	Random, xstep7, 259, 267
	Random, ystep7, 207, 220
	Random, time, 300, 600
	RandomBezier( xstep7, ystep7, xstep, ystep, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, rand, 4000, 5000
	Sleep %rand%
	Random, xstep1, 259, 263
	Random, ystep1, 199, 214
	Random, time, 300, 600
	RandomBezier( xstep, ystep, xstep1, ystep1, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, rand, 2000, 3000
	Sleep %rand%
	Random, xstep2, 322, 330
	Random, ystep2, 198, 203
	Random, time, 300, 600
	RandomBezier( xstep1, ystep1, xstep2, ystep2, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, rand, 7000, 8000
	Sleep %rand%
	Random, xstep3, 300, 307
	Random, ystep3, 203, 214
	Random, speed, 5, 10
	Random, time, 300, 600
	RandomBezier( xstep2, ystep2, xstep3, ystep3, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, rand, 3000, 4000
	Sleep %rand%
	Random, xstep4, 217, 228
	Random, ystep4, 121, 134
	Random, speed, 5, 10
	Random, time, 300, 600
	RandomBezier( xstep3, ystep3, xstep4, ystep4, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, rand, 5000, 6000
	Sleep %rand%
	PixelSearch, x, y, 273, 138, 280, 158, 0x236E5B, 1, Fast
	if ErrorLevel
	{
			RS:
			Random, rand, 2000, 4000
			Sleep %rand%
			PixelSearch, x, y, 273, 138, 280, 158, 0x236E5B, 1, Fast
			if ErrorLevel
			{
				Goto, RS
				Return
			}
			else
			{
				Random, time, 300, 600
				Random, xstep5, 273, 280
				Random, ystep5, 138, 158
				RandomBezier( xstep4, ystep4, xstep5, ystep5, "T" Time A_Space "P3-5" )
				Random, rand, 500, 1500
				Sleep %rand%
				Click
				Random, rand, 9000, 10000
				Sleep %rand%
				Random, xstep6, 127, 133
				Random, ystep6, 206, 212
				Random, time, 300, 600
				RandomBezier( xstep5, ystep5, xstep6, ystep6, "T" Time A_Space "P3-5" )
				Random, rand, 500, 1500
				Sleep %rand%
				Click
				Random, rand, 4000, 5000
				Sleep %rand%
				Random, time, 300, 600
				RandomBezier( xstep6, ystep6, xstep7, ystep7, "T" Time A_Space "P3-5" )
				Random, rand, 500, 1500
				Sleep %rand%
				Goto, Start
				Return
			}
	}
	else
	{
	Random, xstep5, 273, 280
	Random, ystep5, 138, 158
	Random, time, 300, 600
	RandomBezier( xstep4, ystep4, xstep5, ystep5, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, rand, 9000, 10000
	Sleep %rand%
	Random, xstep6, 127, 133
	Random, ystep6, 206, 212
	Random, time, 300, 600
	RandomBezier( xstep5, ystep5, xstep6, ystep6, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, rand, 4000, 5000
	Sleep %rand%
	Random, time, 300, 600
	RandomBezier( xstep6, ystep6, xstep7, ystep7, "T" Time A_Space "P3-5" )
	Random, rand, 500, 1500
	Sleep %rand%
	Goto, Start
	}
	}
}
return
ForceExitApp:
SetTimer,  ForceExitApp, Off
ExitApp
numpad2::exitapp
