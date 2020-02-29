#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#Persistent
;
; 
;            
; Windowed mode, compass north, uparrow all the way up, Zoom setting check screenshot
;            https://gyazo.com/0d40a0eb199faddd5cf15ce8c6844de4
; This script is only 2 rocks but you can read it and follow for a third rock, to edit coords just Ctrl+F: ";;"
; The 2 ores must be ready when you start the script or it might break
;              ((The dropping of ores might not work, just replace with your own inventory dropping script))
;                      NUMPAD1: START ||   NUMPAD0:: STOP
;
;                   [[Please use as information because this is an easy ban, the mousemove is really bad in this script...]]
;
;
;
;
Numpad1 up::
FirstRock:
PixelSearch, x, y, 258, 206, 266, 214, 0x223F62, 1, Fast ;;First rock coords
if ErrorLevel
{
	Random, gotor, 150, 300
	Sleep %gotor%
	PixelSearch, x, y, 689, 455, 729, 484, 0x00FF00, 1, Fast ;;Last item inventory coords
                if ErrorLevel
	                    {
							PixelSearch, x, y, 9, 1243, 513, 1352, 0x800000, 1, Fast ;;Levelup message coords
								if ErrorLevel
								{
									Goto, SecondRock
									return
								}
								else
								{
									;;This script to bypass the levelup message is really old, sorry!
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
	Random, xore1, 258, 266 ;;First rock x-coords
	Random, yore1, 206, 214 ;;First rock y-coords
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
PixelSearch, x, y, 258, 206, 266, 214, 0x223F62, 1, Fast ;;First rock coords
if ErrorLevel
{
	Random gobackfirst1, 150, 300
	Sleep %gobackfirst1%
	PixelSearch, x, y, 689, 455, 729, 484, 0x00FF00, 1, Fast ;;Last item inventory coords
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
		PixelSearch, x, y, 9, 1243, 513, 1352, 0x800000, 1, Fast ;;Levelup message coords
		if ErrorLevel
			{
			 	Goto, MakeSureIsDone
				return
			}
		else
			{
			;;This code needs some re-work lol, but it works I guess
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
}
return


SecondRock:
PixelSearch, x, y, 242, 196, 251, 206, 0x2B4E78, 2, Fast ;;Second Rock Coords
if ErrorLevel
{
	Random, gotor, 150, 300
	Sleep %gotor%
	PixelSearch, x, y, 689, 455, 729, 484, 0x00FF00, 1, Fast ;;Last item inventory coords
                if ErrorLevel
	                    {
							PixelSearch, x, y, 9, 1243, 513, 1352, 0x800000, 1, Fast ;;Levelup message coords
								if ErrorLevel
								{
									Goto, FirstRock
									return
								}
								else
								{
									;;Messy level-up code
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
	Random, xore2, 242, 251
	Random, yore2, 196, 206
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
PixelSearch, x, y, 242, 196, 251, 206, 0x2B4E78, 2, Fast ;;Second Rock Coords
if ErrorLevel
{
	Random gobackfirst, 150, 300
	Sleep %gobackfirst%
	PixelSearch, x, y, 689, 455, 729, 484, 0x00FF00, 1, Fast ;;Last item inventory coords
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
		PixelSearch, x, y, 9, 1243, 513, 1352, 0x800000, 1, Fast ;;Levelup message coords
		if ErrorLevel
			{
			 	Goto, MakeSureIsDone2
				return
			}
		else
			{
				;; Shitty levelup message bypass script
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


DropOres:
Msgbox, DropOres ;;remove this thing, was just trying for testing
Send {Shift down}
MouseGetPos, Opx,Opy
    Loop 50 {
PixelSearch, PX, PY, 0, 0, A_ScreenWidth, A_ScreenWidth, 0xBDF569, 0,Fast RGB
If (ErrorLevel != 0) {
    	;MsgBox, Script Broke Unkown Reasons
        Send {Shift up}
        MouseMove Opx,Opy

        return
}
Random Offset_x, 1, 5
Random Offset_y, 1, 5
;;Random sleep_1 , 100,155
Random waiter, 120, 140

    Sleep waiter
	MouseClick, left ,PX + Offset_x,PY + Offset_y, 1, 4
    Sleep waiter


}   
Send {Shift up}
MouseMove Opx,Opy
Goto, FirstRock
return

Numpad0::
ExitApp
