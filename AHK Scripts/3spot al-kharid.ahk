#SingleInstance Force
#Persistent
; USER NOTE MUST HAVE 2 ORES READY BEFORE STARTING SCRIPT
;            IRON ORES IS 0x182242 / 0x16213E
; https://gyazo.com/2798c6d719ec50b384ba1bcf697fef77
;            COPPER ORES IS 0x27466C
Numpad1 up::
; Left ALK
FirstRock:
PixelSearch, x, y, 109, 183, 184, 247, 0x16213E, 1, Fast
if ErrorLevel
{
	Random, gotor, 150, 300
	Sleep %gotor%
	PixelSearch, x, y, 694, 459, 720, 481, 0xFF00FF, 1, Fast
                if ErrorLevel
	                    {
							PixelSearch, x, y, 119, 401, 465, 423, 0x800000, 1, Fast
								if ErrorLevel
								{
									Goto, SecondRock
									return
								}
								else
								{
									Random, wtf, 60, 110
									Sleep, %wtf%
									Random, levelup, 600, 800
									Sleep %levelup%
									Send {Space}
									Random, levelup, 600, 800
									Sleep %levelup%
									Send {Space}
									Random, small, 150, 300
									Sleep %small%
									Goto, SecondRock
									return
								}
	                    }
                else
	                    {
	                        Goto, DropOres
	                    }
}
else
{
	Random, xore1, 109, 184
	Random, yore1, 183, 247
	Random, speed, 2, 4
	MouseMove %xore1%, %yore1%, %speed%
	Random, beforeclick, 30, 300
	Sleep %beforeclick%
	Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
	Click, up
	Random, rand, 150, 330
	Sleep %rand%
	Goto, MakeSureIsDone
}
return

MakeSureIsDone:
PixelSearch, x, y, 109, 183, 184, 247, 0x16213E, 1, Fast
if ErrorLevel
{
	Random gobackfirst1, 150, 300
	Sleep %gobackfirst1%
	PixelSearch, x, y, 690, 455, 725, 488, 0xFF00FF, 1, Fast
                if ErrorLevel
	                    {
	                        Goto, SecondRock
	                    }
                else
	                    {
	                        Goto, DropOres
	                    }
}
else
{
Loop
{
	Random waitalil, 150, 300
	Sleep %waitalil%
		PixelSearch, x, y, 119, 401, 465, 423, 0x800000, 1, Fast
		if ErrorLevel
			{
			 	Goto, MakeSureIsDone
				return
			}
		else
			{
				Random, wtf, 60, 110
				Sleep, %wtf%
				Send {Space}
				Random, levelup, 600, 800
				Sleep %levelup%
				Send {Space}
				Random, levelup, 600, 800
				Sleep %levelup%
				Send {Space}
				Random, small, 150, 300
				Sleep %small%
				Goto, FirstRock
				return
			}
}
	Click, down
	Random, clicki, 35, 150
	Click, up
	Random, rand, 150, 330
	Sleep %rand%
	Goto, MakeSureIsDone
}
return

SecondRock:
PixelSearch, x, y, 224, 96, 285, 156, 0x16213E, 0, Fast
if ErrorLevel
{
	Random, gotor, 150, 300
	Sleep %gotor%
	PixelSearch, x, y, 690, 455, 725, 488, 0xFF00FF, 1, Fast
                if ErrorLevel
	                    {
							PixelSearch, x, y, 119, 401, 465, 423, 0x800000, 1, Fast
								if ErrorLevel
								{
									Goto, ThirdRock
									return
								}
								else
								{
									Random, wtf, 60, 110
									Sleep, %wtf%
									Send {Space}
									Random, levelup, 600, 800
									Sleep %levelup%
									Send {Space}
									Random, levelup, 600, 800
									Sleep %levelup%
									Send {Space}
									Random, small, 150, 300
									Sleep %small%
									Goto, ThirdRock
									return
								}
	                    }
                else
	                    {
	                        Goto, DropOres
	                    }
}
else
{
	Random, xore2, 224, 285
	Random, yore2, 96, 156
	Random, speed, 2, 5
	MouseMove %xore2%, %yore2%, %speed%
	Random, beforeclick, 30, 300
	Sleep %beforeclick%
	Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
	Click, up
	Random, rand, 250, 330
	Sleep %rand%
	Goto, MakeSureIsDone2
}
return

MakeSureIsDone2:
PixelSearch, x, y, 224, 96, 285, 156, 0x16213E, 0, Fast
if ErrorLevel
{
	Random gobackfirst, 150, 300
	Sleep %gobackfirst%
	PixelSearch, x, y, 690, 455, 725, 488, 0xFF00FF, 1, Fast
                if ErrorLevel
	                    {
	                        Goto, ThirdRock
	                    }
                else
	                    {
	                        Goto, DropOres
	                    }
}
else
{
Loop
{
	Random waitalil, 150, 300
	Sleep %waitalil%
		PixelSearch, x, y, 119, 401, 465, 423, 0x800000, 1, Fast
		if ErrorLevel
			{
			 	Goto, MakeSureIsDone2
				return
			}
		else
			{
				Random, wtf, 60, 110
				Sleep, %wtf%
				Send {Space}
				Random, levelup, 600, 800
				Sleep %levelup%
				Send {Space}
				Random, levelup, 600, 800
				Sleep %levelup%
				Send {Space}
				Random, small, 150, 300
				Sleep %small%
				Goto, SecondRock
				return
			}
}
	Click, down
	Random, clicki, 35, 150
	Click, up
	Random, rand, 150, 330
	Sleep %rand%
	Goto, MakeSureIsDone2
}
return

ThirdRock:
PixelSearch, x, y, 225, 290, 288, 345, 0x16213E, 0, Fast
if ErrorLevel
{
	Random, gotor, 150, 300
	Sleep %gotor%
	PixelSearch, x, y, 690, 455, 725, 488, 0xFF00FF, 1, Fast
                if ErrorLevel
	                    {
							PixelSearch, x, y, 119, 401, 465, 423, 0x800000, 1, Fast
								if ErrorLevel
								{
									Goto, FirstRock
									return
								}
								else
								{
									Random, wtf, 60, 110
									Sleep, %wtf%
									Send {Space}
									Random, levelup, 600, 800
									Sleep %levelup%
									Send {Space}
									Random, levelup, 600, 800
									Sleep %levelup%
									Send {Space}
									Random, small, 150, 300
									Sleep %small%
									Goto, FirstRock
									return
								}
	                    }
                else
	                    {
	                        Goto, DropOres
	                    }
}
else
{
	Random, xore2, 225, 288
	Random, yore2, 290, 345
	Random, speed, 2, 5
	MouseMove %xore2%, %yore2%, %speed%
	Random, beforeclick, 30, 300
	Sleep %beforeclick%
	Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
	Click, up
	Random, rand, 250, 330
	Sleep %rand%
	Goto, MakeSureIsDone3
}
return

MakeSureIsDone3:
PixelSearch, x, y, 225, 290, 288, 345, 0x16213E, 0, Fast
if ErrorLevel
{
	Random gobackfirst, 150, 300
	Sleep %gobackfirst%
	PixelSearch, x, y, 690, 455, 725, 488, 0xFF00FF, 1, Fast
                if ErrorLevel
	                    {
	                        Goto, FirstRock
	                    }
                else
	                    {
	                        Goto, DropOres
	                    }
}
else
{
Loop
{
	Random waitalil, 150, 300
	Sleep %waitalil%
		PixelSearch, x, y, 119, 401, 465, 423, 0x800000, 1, Fast
		if ErrorLevel
			{
			 	Goto, MakeSureIsDone3
				return
			}
		else
			{
				Random, wtf, 60, 110
				Sleep, %wtf%
				Send {Space}
				Random, levelup, 600, 800
				Sleep %levelup%
				Send {Space}
				Random, levelup, 600, 800
				Sleep %levelup%
				Send {Space}
				Random, small, 150, 300
				Sleep %small%
				Goto, ThirdRock
				return
			}
}
	Click, down
	Random, clicki, 35, 150
	Click, up
	Random, rand, 150, 330
	Sleep %rand%
	Goto, MakeSureIsDone3
}
return



DropOres:
Send {Shift down}
													Random, sleepie, 50, 151
													Sleep, %sleepie%
;Random, speed, 2, 4
;Random, xslot1, 570, 595
;Random, yslot1, 245, 263
;MouseMove, %xslot1%, %yslot1%, %speed%
;Click, down
;	Random, clicki, 35, 150
;	Sleep %clicki%
;Click, up
;													Random, sleepie, 50, 151
;													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot2, 612, 630
Random, yslot2, 245, 263
MouseMove, %xslot2%, %yslot2%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot3, 570, 595
Random, yslot3, 280, 300
MouseMove, %xslot3%, %yslot3%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot4, 612, 630
Random, yslot4, 280, 300
MouseMove, %xslot4%, %yslot4%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot5, 570, 595
Random, yslot5, 315, 338
MouseMove, %xslot5%, %yslot5%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot6, 612, 630
Random, yslot6, 315, 338
MouseMove, %xslot6%, %yslot6%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot7, 570, 595
Random, yslot7, 351, 375
MouseMove, %xslot7%, %yslot7%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot8, 612, 630
Random, yslot8, 351, 375
MouseMove, %xslot8%, %yslot8%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot9, 570, 595
Random, yslot9, 387, 410
MouseMove, %xslot9%, %yslot9%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot10, 612, 630
Random, yslot10, 387, 410
MouseMove, %xslot10%, %yslot10%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot11, 570, 595
Random, yslot11, 424, 444
MouseMove, %xslot11%, %yslot11%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot12, 612, 630
Random, yslot12, 424, 444
MouseMove, %xslot12%, %yslot12%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot13, 570, 595
Random, yslot13, 459, 481
MouseMove, %xslot13%, %yslot13%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot14, 612, 630
Random, yslot14, 459, 481
MouseMove, %xslot14%, %yslot14%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot15, 654, 675
Random, yslot15, 245, 263
MouseMove, %xslot15%, %yslot15%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot16, 694, 720
Random, yslot16, 245, 263
MouseMove, %xslot16%, %yslot16%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot17, 654, 675
Random, yslot17, 280, 300
MouseMove, %xslot17%, %yslot17%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot18, 694, 720
Random, yslot18, 280, 300
MouseMove, %xslot18%, %yslot18%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot19, 654, 675
Random, yslot19, 315, 338
MouseMove, %xslot19%, %yslot19%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot20, 694, 720
Random, yslot20, 315, 338
MouseMove, %xslot20%, %yslot20%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot21, 654, 675
Random, yslot21, 351, 375
MouseMove, %xslot21%, %yslot21%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot22, 694, 720
Random, yslot22, 351, 375
MouseMove, %xslot22%, %yslot22%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot23, 654, 675
Random, yslot23, 387, 410
MouseMove, %xslot23%, %yslot23%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot24, 694, 720
Random, yslot24, 387, 410
MouseMove, %xslot24%, %yslot24%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot25, 654, 675
Random, yslot25, 424, 444
MouseMove, %xslot25%, %yslot25%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot26, 694, 720
Random, yslot26, 424, 444
MouseMove, %xslot26%, %yslot26%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot27, 654, 675
Random, yslot27, 459, 481
MouseMove, %xslot27%, %yslot27%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Random, speed, 2, 4
Random, xslot28, 694, 720
Random, yslot28, 459, 481
MouseMove, %xslot28%, %yslot28%, %speed%
Click, down
	Random, clicki, 35, 150
	Sleep %clicki%
Click, up
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Send {Shift up}
													Random, sleepie, 50, 151
													Sleep, %sleepie%
Goto, FirstRock
return

Numpad9::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position is %color%.
return

Numpad0::
ExitApp