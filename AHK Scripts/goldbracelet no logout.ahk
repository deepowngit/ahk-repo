FileContent := RunWaitOne("ipconfig /all")
If InStr(FileContent, "08-00-27-68-90-BF")
{
numpad1::
SetTimer, ForceExitApp, 14400000 ; 4 HOURS
Loop
{
	Click, down
	Click, up
	Random, rand, 500, 1500
	Sleep %rand%
	send {esc}
	Random, rand, 500, 1500
	Sleep %rand%
	Random, xfurnace, 425, 430
	Random, yfurnace, 143, 150
	Random, speed, 5, 10
	MouseMove %xfurnace%, %yfurnace%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click, down
	Click, up
	Random, run, 5500, 7500
	Sleep %run%
	Random, xsmith, 60, 77
	Random, ysmith, 302, 320
	Random, speed, 5, 10
	MouseMove %xsmith%, %ysmith%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click, down
	Click, up
	Random, smelt, 50000, 53000
	Sleep %smelt%
	Random, xbanker, 28, 35
	Random, ybanker, 279, 286
	Random, speed, 5, 10
	MouseMove %xbanker%, %ybanker%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click, down
	Click, up
	Random, run, 5500, 7500
	Sleep %run%
	Random, xbank, 434, 455
	Random, ybank, 328, 344
	Random, speed, 5, 10
	MouseMove %xbank%, %ybank%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click, down
	Click, up
	Random, xgoldbar, 131, 150
	Random, ygoldbar, 114, 127
	Random, speed, 5, 10
	MouseMove %xgoldbar%, %ygoldbar%, %speed%
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