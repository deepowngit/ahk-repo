FileContent := RunWaitOne("ipconfig /all")
If InStr(FileContent, "00-D8-61-72-2F-60")
{
TrayTip, Spirit, Injection into system sucessful`nStatus: Undetected., 5
Menu, Tray, Tip, Spirit Cannonball Script
Menu, Tray, NoMainWindow
Menu, Tray, NoIcon 
numpad1::
SetTimer, ForceExitApp, 20700000 ; 5 hours 45 mins
Loop
{
	Click
	Random, rand, 500, 1500
	Sleep %rand%
	Send {esc}
	Random, rand, 500, 1500
	Sleep %rand%
	Random, xfurnace, 425, 430
	Random, yfurnace, 143, 150
	Random, xspeed, 5, 10
	MouseMove %xfurnace%, %yfurnace%, %xspeed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, run, 5500, 7500
	Sleep %run%
	Random, xsmith, 224, 305
	Random, ysmith, 423, 479
	Random, xspeed2, 5, 10
	MouseMove %xsmith%, %ysmith%, %xspeed2%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, smelt, 163000, 166000
	Sleep %smelt%
	Random, xbanker, 28, 35
	Random, ybanker, 279, 286
	Random, xspeed3, 5, 10
	MouseMove %xbanker%, %ybanker%, %xspeed3%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, run, 5500, 7500
	Sleep %run%
	Random, xbank, 434, 455
	Random, ybank, 328, 344
	Random, xspeed4, 5, 10
	MouseMove %xbank%, %ybank%, %xspeed4%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, xgoldbar, 131, 150
	Random, ygoldbar, 114, 127
	Random, xspeed5, 5, 10
	MouseMove %xgoldbar%, %ygoldbar%, %xspeed5%
	Random, rand, 500, 1500
	Sleep %rand%
}
return
ForceExitApp:
SetTimer,  ForceExitApp, Off
ExitApp
numpad2::exitapp
}
else
{
    MsgBox, 0, Spirit, This computer is not authorized.
    ExitApp
}

RunWaitOne(command) {
    ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
    shell := ComObjCreate("WScript.Shell")
    ; Execute a single command via cmd.exe
    exec := shell.Exec(ComSpec " /C " command)
    ; Read and return the command's output
    return exec.StdOut.ReadAll()
}