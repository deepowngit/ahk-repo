#SingleInstance Force


/*
INSTRUCTIONS:
-Display on fixed mode
-Rod and feathers in first 2 backpack slots
-Fishing overlay ON - Untick: spot icons, names, and currently fished fish
-Agility overlay OFF
-Camera Zoom OFF
-Entity Hider ON (do not hide NPCs, NPCs 2D, Local player, Local player 2D)
-Catch a fish manually to get fishing overlay to pop up
-Tag fish you want to drop with group 4 (purple) color in backpack
-Make sure no fish are in last backpack slot before starting script (will trigger drop loop otherwise)
-Default zoom, face north with camera all the way up (bird's eye view)
*/

Wait() ; Used before every Click command
{
	Random, sleeptime, 50, 150
	Sleep sleeptime
}


Ctrl:: ; toggle to start script after launching .ahk file
toggle := !toggle
Loop ; infinite loop
{
    if !toggle
    {
        break
    }
    else
	{
		GoTo, activate
	}
activate: ; activates RuneLite window
WinActivate, ahk_class SunAwtFrame
Sleep 500
GoTo, screensearch
screensearch: ; looks for a fishing spot
pixelsearch, x, y, 10, 90, 517, 361, 0xB2B200, 1, Fast 
if errorlevel 
GoTo, minimapsearch
else
{
    mousegetpos, MouseX, MouseY
    random, randx, -4, -28
    random, randy, 1, 15
    Random, speed, 300, 600
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks fishing spot
    GoTo, waituntilfishing
}
waituntilfishing: ; waits until player begins fishing animation
random, sleeptime, 5000, 7000
sleep sleeptime
GoTo, afkcheck
afkcheck:
pixelsearch, x, y, 11, 47, 163, 134, 0x00FF00, 1, Fast ; looks for green fishing text in top left
if errorlevel
{
Random, sleeptime, 1500, 2500
sleep sleeptime
GoTo, backpackcheck
}
else
    GoTo, afkcheck
minimapsearch:
pixelsearch, x, y, 606, 50, 699, 181, 0xB2B200, 1, Fast ; looks for blue fishing spot icon on minimap
if errorlevel
    GoTo, screensearch
else
{
    mousegetpos, MouseX, MouseY
    random, randx, -1, 3
    random, randy, 1, 4
    Random, speed, 300, 600
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click
    random, sleeptime, 11000, 13000
    sleep sleeptime
    GoTo, screensearch
}
backpackcheck: ; checks for fish in last backpack slot to see if backpack is full
pixelsearch, x, y, 687, 454, 730, 490, 0xFF00FF, 1, Fast
if errorlevel
    GoTo, screensearch
else
    GoTo, dropallfish
dropallfish:
mousegetpos, MouseX, MouseY ; 3
random, x, 657, 675
random, y, 250, 263
Random, speed, 300, 600
RandomBezier( MouseX, MouseY, x, y, "T"speed "P2-5")
Wait()
Send, {Shift Down}
random, sleeptime, 70, 150
sleep sleeptime
Click

mousegetpos, MouseX, MouseY ; 4
random, x, 699, 718
random, y, 249, 262
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 5
random, x, 573, 592
random, y, 285, 298
Random, speed, 300, 600
RandomBezier( MouseX, MouseY, x, y, "T"speed "P2-5")
Wait()
Click

mousegetpos, MouseX, MouseY ; 6
random, x, 614, 634
random, y, 286, 298
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 7
random, x, 658, 677
random, y, 287, 298
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 8
random, x, 699, 717
random, y, 286, 298
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 9
random, x, 572, 592
random, y, 323, 334
Random, speed, 300, 600
RandomBezier( MouseX, MouseY, x, y, "T"speed "P2-5")
Wait()
Click

mousegetpos, MouseX, MouseY ; 10
random, x, 614, 632
random, y, 322, 334
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 11
random, x, 657, 675
random, y, 323, 335
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 12
random, x, 699, 717
random, y, 321, 334
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 13
random, x, 572, 591
random, y, 358, 371
Random, speed, 300, 600
RandomBezier( MouseX, MouseY, x, y, "T"speed "P2-5")
Wait()
Click

mousegetpos, MouseX, MouseY ; 14
random, x, 614, 633
random, y, 359, 371
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 15
random, x, 656, 675
random, y, 357, 369
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 16
random, x, 699, 718
random, y, 359, 369
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 17
random, x, 573, 591
random, y, 394, 404
Random, speed, 300, 600
RandomBezier( MouseX, MouseY, x, y, "T"speed "P2-5")
Wait()
Click

mousegetpos, MouseX, MouseY ; 18
random, x, 615, 633
random, y, 395, 405
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 19
random, x, 657, 677
random, y, 394, 404
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 20
random, x, 699, 716
random, y, 394, 404
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 21
random, x, 572, 592
random, y, 431, 441
Random, speed, 300, 600
RandomBezier( MouseX, MouseY, x, y, "T"speed "P2-5")
Wait()
Click

mousegetpos, MouseX, MouseY ; 22
random, x, 615, 633
random, y, 429, 439
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 23
random, x, 657, 675
random, y, 429, 439
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 24
random, x, 699, 718
random, y, 431, 441
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 25
random, x, 573, 592
random, y, 466, 476
Random, speed, 300, 600
RandomBezier( MouseX, MouseY, x, y, "T"speed "P2-5")
Wait()
Click

mousegetpos, MouseX, MouseY ; 26
random, x, 615, 634
random, y, 465, 475
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 27
random, x, 657, 676
random, y, 466, 476
mousemove, %x%, %y%
Wait()
Click

mousegetpos, MouseX, MouseY ; 28
random, x, 698, 717
random, y, 465, 475
mousemove, %x%, %y%
Wait()
Click
random, sleeptime, 70, 150
sleep sleeptime
Send, {Shift Up}
random, sleeptime, 200, 350
Sleep sleeptime
GoTo, screensearch
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