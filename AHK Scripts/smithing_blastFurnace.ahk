#SingleInstance Force

/*
SCRIPT WRITTEN BY Rehz#9094
equip goldsmith gauntlets
ice gloves in 1st backpack slot
gold ore in 1st bank slot
1 dose staminas in 2nd
fill backpack with gold ore (except ice gloves spot)
fill bank with placeholders
start in front of bank chest
camera zoom ON, camera all the way up, face north, zoom all the way out
Blast Furnace plugin ON
mark bank chest
withdraw quantity set to All
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
GoTo, putoreonconveyorbelt
putoreonconveyorbelt:
pixelsearch, x, y, 129, 42, 259, 114, 0x00FF00, 1, Fast ; 218 87
if errorlevel
{
    msgbox, did not find conveyor belt!
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, randx, -5, -13
    random, randy, -7, 5
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks conveyor belt
    GoTo, depositorewait
}
depositorewait:
pixelsearch, x, y, 685, 450, 733, 487, 0x1AB2DA, 1, Fast ; looks for gold ore in last backpack slot
if errorlevel
    GoTo, depositorewait
else
{
    random, sleeptime, 500, 1000
    sleep sleeptime
    GoTo, goldoredepositwait1
}
goldoredepositwait1:
pixelsearch, x, y, 402, 75, 519, 311, 0xFFFFFF, 1, Fast ; looks for white XP drop
if errorlevel
    GoTo, goldoredepositwait1
else
{
    random, sleeptime, 200, 400
    sleep sleeptime
    GoTo, equipicegloves
}
equipicegloves:
pixelsearch, x, y, 557, 234, 600, 272, 0x998B56, 1, Fast ; looks for ice gloves in 1st backpack slot
if errorlevel
{
    msgbox, did not find ice gloves in 1st backpack slot
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, movex, 570, 593
    random, movey, 245, 263
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click ; equips ice gloves
    GoTo, goldbarwait
}
goldbarwait:
pixelsearch, x, y, 203, 213, 300, 273, 0x00FF00, 1, Fast
if errorlevel
    GoTo, goldbarwait
else
{
    random, sleeptime, 500, 1000
    sleep sleeptime
    GoTo, takegoldbars
}
takegoldbars:
pixelsearch, x, y, 203, 213, 300, 273, 0x00FF00, 1, Fast ; 261, 230
if errorlevel
{
    msgbox, something went wrong taking gold bars.
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, randx, -4, -17
    random, randy, 4, 12
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks take gold bars
    GoTo, takegoldbarswait
}
takegoldbarswait:
pixelsearch, x, y, 39, 375, 319, 412, 0x203040, 1, Fast ; looks for take gold bars chatbox
if errorlevel
    GoTo, takegoldbarswait
else
{
    random, sleeptime, 500, 800
    sleep sleeptime
    Send, {Space 1}
    GoTo, goldbarstakenwait
}
goldbarstakenwait:
pixelsearch, x, y, 686, 454, 734, 490, 0x1AB0D8, 1, Fast ; looks for gold bar in last backpack slot
if errorlevel
    GoTo, goldbarstakenwait
else
{
    random, sleeptime, 200, 400
    sleep sleeptime
    GoTo, depositgoldbars
}
depositgoldbars:
pixelsearch, x, y, 279, 241, 482, 353, 0x00FFFF, 1, Fast ; looks for bank chest 355 278
if errorlevel
{
    msgbox, did not find bank chest!
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, randx, -2, -4
    random, randy, 4, 13
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, bankinterfacewait
}
bankinterfacewait:
pixelsearch, x, y, 153, 39, 380, 61, 0x1F98FF, 1, Fast
if errorlevel
    GoTo, bankinterfacewait
else
{
    random, sleeptime, 200, 350
    sleep sleeptime
    GoTo, depositgoldbarsinbank
}
depositgoldbarsinbank:
MouseGetPos, MouseX, MouseY
random, movex, 434, 460
random, movey, 326, 352
Random, speed, 300, 700
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click ; deposists inventory
GoTo, depositgoldbarswait
depositgoldbarswait:
pixelsearch, x, y, 561, 273, 734, 488, 0x1AB0D8, 1, Fast
if errorlevel
{
    random, sleeptime, 200, 400
    sleep sleeptime
    GoTo, staminacheck
}
else
    GoTo, depositgoldbarswait
staminacheck:
pixelsearch, x, y, 563, 142, 564, 143, 0x131313, 1, Fast
if errorlevel
    GoTo, withdrawgoldore
else
    GoTo, withdrawstaminapotion
withdrawstaminapotion:
pixelsearch, x, y, 118, 110, 162, 149, 0x3A6280, 1, Fast ; looks for staminas in 2nd bank slot
if errorlevel
{
    msgbox, did not find 1 dose staminas in 2nd bank slot!
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, movex, 127, 146
    random, movey, 117, 136
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click Right
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 39, 43
    MouseMove, 0, %n%, 2, R
    Wait()
    Click ; withdraws 1 stamina 1 dose potion
    GoTo, withdrawstaminawait
}
withdrawstaminawait:
pixelsearch, x, y, 603, 233, 644, 279, 3A6280, 1, Fast
if errorlevel
    GoTo, withdrawstaminawait
else
{
    random, sleeptime, 200, 350
    sleep sleeptime
    Send, {Esc 1}
    random, sleeptime, 500, 1000
    sleep sleeptime
    GoTo, drinkstamina
}
drinkstamina:
mousegetpos, MouseX, MouseY
random, speed, 300, 700
random, movex, 615, 632
random, movey, 247, 266
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click ; drinks stamina
random, sleeptime, 3000, 4000
sleep sleeptime
GoTo, backtobank
backtobank:
pixelsearch, x, y, 217, 166, 366, 270, 0x00FFFF, 1, Fast ; 269 203
if errorlevel
{
    msgbox, did not find bank chest after drinking stamina!
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, randx, -2, -5
    random, randy, 3, 10
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, bankinterfacewait2
}
bankinterfacewait2:
pixelsearch, x, y, 153, 39, 380, 61, 0x1F98FF, 1, Fast
if errorlevel
    GoTo, bankinterfacewait
else
{
    random, sleeptime, 200, 350
    sleep sleeptime
    GoTo, withdrawgoldore
}
withdrawgoldore:
pixelsearch, x, y, 67, 105, 112, 143, 0x1AAED5, 1, Fast ; looks for gold ore in 1st bank slot
if errorlevel
{
    msgbox, did not find gold ore
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, movex, 80, 101
    random, movey, 118, 131
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click ; withdraws gold ore
    GoTo, withdrawgoldorewait
}
withdrawgoldorewait:
pixelsearch, x, y, 686, 454, 734, 490, 0x1AAED5, 1, Fast 
if errorlevel
    GoTo, withdrawgoldorewait
else
{
    random, sleeptime, 200, 350
    sleep sleeptiem
    GoTo, exitbank
}
exitbank:
Send, {Esc 1}
random, sleeptime, 500, 700
sleep sleeptime
GoTo, equipgoldsmithgauntlets
equipgoldsmithgauntlets:
pixelsearch, x, y, 557, 234, 603, 276, 0x568D99, 1, Fast ; looks for goldsmith gauntlets in 1st backpack slot
if errorlevel
{
    msgbox, did not find golsmith gauntlets in first backpack slot!
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 700
    random, movex, 571, 593
    random, movey, 245, 264
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click ; equips goldsmith gauntlets
    GoTo, goldsmithequipwait
}
goldsmithequipwait:
pixelsearch, x, y, 557, 234, 603, 274, 0xD3C17C, 1, Fast
if errorlevel
    GoTo, goldsmithequipwait
else
{
    random, sleeptime, 200, 350
    sleep sleeptime
    GoTo, putoreonconveyorbelt
}

} ; ends infinite loop
    

    






































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
