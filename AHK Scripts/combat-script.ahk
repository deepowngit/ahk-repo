FileContent := RunWaitOne("ipconfig /all")
If InStr(FileContent, "00-D8-61-17-7E-16")
{
TrayTip, Spirit, Injection into system sucessful`nStatus: Undetected., 5
Menu, Tray, Tip, Spirit Combat Script
Menu, Tray, NoMainWindow
Menu, Tray, NoIcon 
Gui, Add, Text,, How long the script waits before attacking another monster?
Gui, Add, Text,, Between
Gui, Add, Edit, vFirstparam -WantReturn
Gui, Add, Text,, and
Gui, Add, Edit, vSecparam -WantReturn
Gui, Add, Text,, milliseconds
Gui, Add, Button, Default, OK
Gui, Show
return

GuiClose:
ExitApp
return

ButtonOK:
Gui, Submit
Gui, Destroy
Return

Numpad1::

Loop
{

PixelSearch, x, y, 0, 0, %A_ScreenWidth%,%A_ScreenHeight% , 0xFFFF00, 0, Fast
	Click %x%,%y%
	Random, rand, %Firstparam%, %Secparam%
	Sleep %rand%
PixelSearch, px, py, 0, 0, %A_ScreenWidth%,%A_ScreenHeight% , 0xFF00AA, 0, Fast
if ErrorLevel
	Sleep 1
else
	Click %px%,%py%
	Random, feather, 3000, 5900
	Sleep %feather%
}
return


Numpad9::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position is %color%.
return

Numpad0::ExitApp
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