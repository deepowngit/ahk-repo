#SingleInstance Force
/*
SCRIPT WRITTEN BY Rehz#9094
start in front of western clay oven in hosidius kitchen
mark bank chest and western clay oven in hosidius kitchen
raw sharks in first bank slot
runelite camera zoom off
zoom all the way out 
camera all the way up
withdraw quantity set to All
entity hider on
*/
Wait() ; use before every Click command
{
	Random, sleeptime, 70, 150
	Sleep sleeptime
}


Ctrl::
toggle := !toggle
Loop
{
    if !toggle
    {
        break
    }
    else
	{
		GoTo, activate
	}
	
activate:
WinActivate, ahk_class SunAwtFrame
Sleep 500
GoTo, bankchest

bankchest:
pixelsearch, x, y, 160, 252, 327, 346, 0x00FFFF, 1, Fast ; looks for bank chest 242 277
if errorlevel
{
    msgbox, did not find bank chest.
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, randx, -3, -12
    random, randy, 3, 11
    random, speed, 300, 1300
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, bankinterfacewait
}

bankinterfacewait:
pixelsearch, x, y, 164, 39, 366, 63, 0x1F98FF, 1, Fast ; looks for bank interface text at top
if errorlevel
	GoTo, bankinterfacewait
else
{
	random, sleeptime, 250, 400
	sleep sleeptime
    GoTo, depositinventory
}

depositinventory:
mousegetpos, MouseX, MouseY
random, movex, 434, 459
random, movey, 328, 353
random, speed, 300, 1300
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click ; clicks deposit inventory
random, sleeptime, 1000, 1500
sleep sleeptime
GoTo, withdrawsharks

withdrawsharks:
pixelsearch, x, y, 67, 106, 116, 144, 0x527244, 1, Fast ; looks for raw anglerfish in 1st bank slot
if errorlevel 
{
    msgbox, you have run out of raw sharks
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, movex, 80, 104
    random, movey, 114, 136
    random, speed, 300, 1300
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click ; withdraws raw sharks
    GoTo, withdrawsharkswait
}
withdrawsharkswait:
pixelsearch, x, y, 688, 457, 734, 489, 0x527244, 1, Fast ; looks for raw anglerfish in last backpack slot
if errorlevel
    GoTo, withdrawsharkswait
else
{
    random, sleeptime, 250, 400
    sleep sleeptime
    Send, {Esc 1}
    GoTo, bankinterfaceclosewait
}
bankinterfaceclosewait:
pixelsearch, x, y, 164, 39, 366, 63, 0x1F98FF, 1, Fast ; looks for bank interface text at top
if errorlevel
{
    random, sleeptime, 250, 400
    sleep sleeptime
    GoTo, cooksharks
}
else
    GoTo, bankinterfaceclosewait
cooksharks:
pixelsearch, x, y, 235, 85, 335, 159, 0x00FFFF, 1, Fast ; looks for marked clay oven 291 132
if errorlevel
{
    msgbox, did not find clay oven
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, randx, -1, -9
    random, randy, 1, 6
    random, speed, 300, 1300
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks clay oven
    GoTo, cookinterfacewait
}
cookinterfacewait:
pixelsearch, x, y, 54, 375, 301, 399, 0x203040, 1, Fast ; looks for brown bold text
if errorlevel
    GoTo, cookinterfacewait
else
{
    random, sleeptime, 250, 400
    sleep sleeptime
    Send, {Space 1}
    GoTo, waituntildonecooking
}
waituntildonecooking:
pixelsearch, x, y, 688, 457, 734, 489, 0x192B36, 1, Fast ; looks for cooked anglerfish in last backpack slot
if errorlevel
    GoTo, waituntildonecooking
else
{
    random, sleeptime, 1000, 3000
    sleep sleeptime
    GoTo, bankchest
}
}






























*Esc::ExitApp
return


RandomBezier( X0, Y0, Xf, Yf, O="" ) {
    Time := RegExMatch(O,"i)T(\d+)",M)&&(M1>0)? M1: 200
    RO := InStr(O,"RO",0) , RD := InStr(O,"RD",0)
    N:=!RegExMatch(O,"i)P(\d+)(-(\d+))?",M)||(M1<2)? 2: (M1>19)? 19: M1
    If ((M:=(M3!="")? ((M3<2)? 2: ((M3>19)? 19: M3)): ((M1=="")? 5: ""))!="")
        Random, N, %N%, %M%
    OfT:=RegExMatch(O,"i)OT(-?\d+)",M)? M1: 100, OfB:=RegExMatch(O,"i)OB(-?\d+)",M)? M1: 100
    OfL:=RegExMatch(O,"i)OL(-?\d+)",M)? M1: 100, OfR:=RegExMatch(O,"i)OR(-?\d+)",M)? M1: 100
    MouseGetPos, XM, YM
    If ( RO )
        X0 += XM, Y0 += YM
    If ( RD )
        Xf += XM, Yf += YM
    If ( X0 < Xf )
        sX := X0-OfL, bX := Xf+OfR
    Else
        sX := Xf-OfL, bX := X0+OfR
    If ( Y0 < Yf )
        sY := Y0-OfT, bY := Yf+OfB
    Else
        sY := Yf-OfT, bY := Y0+OfB
    Loop, % (--N)-1 {
        Random, X%A_Index%, %sX%, %bX%
        Random, Y%A_Index%, %sY%, %bY%
    }
    X%N% := Xf, Y%N% := Yf, E := ( I := A_TickCount ) + Time
    While ( A_TickCount < E ) {
        U := 1 - (T := (A_TickCount-I)/Time)
        Loop, % N + 1 + (X := Y := 0) {
            Loop, % Idx := A_Index - (F1 := F2 := F3 := 1)
                F2 *= A_Index, F1 *= A_Index
            Loop, % D := N-Idx
                F3 *= A_Index, F1 *= A_Index+Idx
            M:=(F1/(F2*F3))*((T+0.000001)**Idx)*((U-0.000001)**D), X+=M*X%Idx%, Y+=M*Y%Idx%
        }
        MouseMove, %X%, %Y%, 0
        Sleep, 1
    }
    MouseMove, X%N%, Y%N%, 0
    Return N+1
}
