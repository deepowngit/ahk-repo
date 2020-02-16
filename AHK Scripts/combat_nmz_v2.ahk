#SingleInstance Force
 
; SCRIPT WRITTEN BY Rehz#9094
; tag overloads green 00FF00
; tag absorbs purple
; tag overloads green
; NMZ overlay ON
; brightness all the way up

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
GoTo, hpcheck
hpcheck:
pixelsearch, x, y, 551, 75, 551, 75, 0x0007FF, 1, Fast ; looks for red bar near top of hp icon
if errorlevel
    GoTo, overloadcheck
else
{
    mousegetpos, MouseX, MouseY
    random, movex, 551, 567
    random, movey, 110, 126
    random, sped, 300, 700
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click
    random, sleeptime, 500, 700
    sleep sleeptime
    Click
    Sleep 500
    GoTo, overloadcheck
}
overloadcheck:
pixelsearch, x, y, 11, 104, 135, 150, 0x0E0E12, 1, Fast ; looks for overload black
if errorlevel
{
    pixelsearch, x, y, 529, 231, 763, 490, 0x00FF00, 1, Fast ; 664 277
    if errorlevel
    {
        msgbox, you have run out of overloads!
        ExitApp
    }
    else
    {
        mousegetpos, MouseX, MouseY
        random, randx, 1, 6
        random, randy, 1, 21
        random, speed, 300, 1300
        RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
        Wait()
        Click ; drinks overload potion
        GoTo, absorpcheck
    }
}
else
    GoTo, absorpcheck
absorpcheck:
pixelsearch, x, y, 11, 104, 135, 150, 0x00FFFF, 1, Fast ; looks for yellow numbers on absorp potion indicator
if errorlevel
{
     pixelsearch, x, y, 529, 231, 763, 490, 0xFF00FF, 1, Fast
     if errorlevel
    {
        msgbox, you have run out of asorption potions!
        ExitApp
    }
    else
    {
        mousegetpos, MouseX, MouseY
        random, randx, 1, 6
        random, randy, 1, 21
        random, speed, 300, 1300
        RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
        Wait()
        Click ; drinks ansorption potion
        GoTo, hpcheck
    }
}
else
    GoTo, hpcheck
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
