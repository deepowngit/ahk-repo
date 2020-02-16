SingleInstance, Force
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
;
;     --- BEGIN WITH MOUSE ON FLAX IN BANK OF LUMBRIDGE CASTLE ---
;
Numpad1::
Loop
{
	Click
	Random, rand, 512, 1314
	Sleep %rand%
	Send {esc}
    MouseGetPos, xflax, yflax
	Random, xstaircase, 229, 234
	Random, ystaircase, 322, 328
	Random, time, 412, 659
	RandomBezier( xflax, yflax, xstaircase, ystaircase, "T" Time A_Space "P3-5" )
    Random, beforebezier, 150, 300
    Sleep %beforebezier%
	Click
    Random, goingdown, 6123, 6349
    Sleep %goingdown%
    ; We are now on the second floor of the lumbridge castle
	PixelSearch, x, y, 273, 119, 283, 144, 0x00F0FF, 1, Fast
    if ErrorLevel
    {
        ;The door is already open
        Random, xspinningwheel, 296, 300
	    Random, yspinningwheel, 154, 160
	    Random, time, 412, 659
	    RandomBezier( xstaircase, ystaircase, xspinningwheel, yspinningwheel, "T" Time A_Space "P3-5" )
        Random, beforebezier, 150, 300
        Sleep %beforebezier%
        Click
        Random, gotospino, 5126, 5431
        Sleep %gotospino%
        Goto, Next
        Return
    }
    Else
    {
        ;The door is closed
        Random, xdoor, 278, 279
        Random, ydoor, 128, 130
        Random, time, 412, 659
        RandomBezier( xstaircase, ystaircase, xdoor, ydoor, "T" Time A_Space "P3-5")
        Random, beforebezier, 150, 300
        Sleep %beforebezier%
        Click
        Random, openthedoor, 3123, 3631
        Sleep %openthedoor%
        Random, xspinningwheelafterdoor, 285, 288
        Random, yspinningwheelafterdoor, 207, 210
        RandomBezier( xdoor, ydoor, xspinningwheelafterdoor, yspinningwheelafterdoor, "T" Time A_Space "P3-5")
        Random, beforebezier, 150, 300
        Sleep %beforebezier%
        Click
        Random, gotospin, 3123, 3659
        Sleep %gotospin%
        Goto, Next
        Return
    }
Next:
Send {3}
Random, makingmoney, 51531, 52132
Sleep %makingmoney%
MouseGetPos, xdoing, ydoing
	PixelSearch, x, y, 244, 175, 253, 197, 0x00F0FF, 1, Fast
    if ErrorLevel
    {
        ;The door is already open to go back up to the bank
        Random, xstairup, 215, 219
        Random, ystairup, 263, 269
        RandomBezier( xdoing, ydoing, xstairup, ystairup, "T" Time A_Space "P3-5")
        Random, beforebezier, 150, 300
        Sleep %beforebezier%
        Click
        Random, gotostaircase, 4751, 5123
        Sleep %gotostaircase%
        Goto, Ending
        Return
    }
    else
    {
        ;The door re-closed and u need to go to the bank
        Random, xdoorc, 246, 248
        Random, ydoorc, 184, 191
        RandomBezier( xdoing, ydoing, xdoorc, ydoorc, "T" Time A_Space "P3-5")
        Random, beforebezier, 150, 300
        Sleep %beforebezier%
        Click
        Random, goopen, 641, 1111
        Sleep %goopen%
        Random, xstairupafterdoor, 224, 227
        Random, ystairupafterdoor, 271, 278
        RandomBezier( xdoorc, ydoorc, xstairupafterdoor, ystairupafterdoor, "T" Time A_Space "P3-5")
        Random, beforebezier, 150, 300
        Sleep %beforebezier%
        Click
        Random, gotostair, 3151, 3531
        Sleep %gotostair%
        Goto, Ending
        Return
    }
Ending:
Send {1}
MouseGetPos, xwhere, ywhere
Random, xbanking, 293, 298
Random, ybanking, 58, 64
RandomBezier( xwhere, ywhere, xbanking, ybanking, "T" Time A_Space "P3-5")
Random, beforebezier, 600, 900
Sleep %beforebezier%
Click
Random, runtobank, 5123, 5624
Sleep %runtobank%
Random, xbankall, 433, 457
Random, ybankall, 331, 344
RandomBezier( xbanking, ybanking, xbankall, ybankall, "T" Time A_Space "P3-5")
Random, beforebezier, 150, 300
Sleep %beforebezier%
Click
RandomBezier( xbankall, ybankall, xflax, yflax, "T" Time A_Space "P3-5")
Random, beforebezier, 150, 300
Sleep %beforebezier%
}
Return

Numpad0::
ExitApp
