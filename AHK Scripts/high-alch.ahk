#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;
; Written by Redemption#0001
;
;
1::
BlockInput, MouseMove
Loop 
{
	Random mouseMovementx, 712, 720
	Random mouseMovementy, 332, 342
	Random, speed, 8, 14
	Random, loopTillMousemove, 20, 40
	Random, wait, 500, 1500
	
	Mousemove, mouseMovementx, mouseMovementy, speed
	sleep, %wait%
	loop %loopTillMousemove% 
	{
		Random, cast, 2350, 2950
		click
		sleep, %cast% 
	}
}

`::ExitApp
