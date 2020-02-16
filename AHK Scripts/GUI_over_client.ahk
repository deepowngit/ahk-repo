#SingleInstance, Force

Time := 0
Time1 := 0
Time2 := 0

;
;                          - written by Binlade#2932 -
;
;                      Just an example, a gui over a client. Mess around with it and edit to ur likings.
;                      https://gyazo.com/4bb942628d84051bfb5fef92fd1e4c5f
;
Numpad1::
IfWinExist, RuneLite
WinActivate
SetTimer, ShowGui, 1000
SetTimer, CloseGui, 2500
Sleep, 1000

Gui, 2:Font, s7
Gui, 2:Add, Text, x5 y5 w200 h50 vTimer,
return

ShowGui:    
    {
    WinWait, ahk_class SunAwtFrame
    WinGetPos, GuiX, GuiY,,, ahk_class SunAwtFrame
    WinGet, WinID, ID, ahk_class SunAwtFrame
    IfWinExist, ahk_class SunAwtFrame
        {
    GuiX := GuiX + 10
    GuiY := GuiY + 371
    Gui, 2:+Owner%WinID%
    Gui, 2:-Caption
    Gui, 2:Show, NoActivate x%GuiX% y%GuiY% w507 h130
    Gui, 2:Color, 0xCCBB9A3
        Time++
        if (time = 60){
            Time1 := Time1 + 1
            Time := 0
            }
        if (time1 = 60){
            Time2 := Time2 + 1
            Time1 := 0
            }
        GuiControl, 2:, Timer,%Time2% Hours %Time1% Minutes %Time% Seconds Runtime.
        }
    return
    }
    
CloseGui:
    {
    IfWinNotExist, ahk_id %WinID%
        {
    Gui, Destroy
    ExitApp
        }
    return
    }
