Colors := {Lobster: "0x0F2F63", Shark:"0x7E7F8A", Karambwan:"0x355D45", DarkCrabs:"0x25382B", Monkfish:"0x7578AC", SeaTurtle:"0x205F6D"}

Menu, Tray, NoMainWindow
Menu, Tray, NoIcon 
Gui, Add, Text, Center, Which meat do you want to cook?
Gui, Add, DropDownList, vCookingChoice, Shark|Karambwan|DarkCrabs|Monkfish|SeaTurtle|Lobster
Gui, Add, Button, Default, OK
Gui, Show
return

GuiClose:
ExitApp
return

ButtonOK:
Gui, Submit
Gui, Destroy
return

Numpad8::
Gui, Submit, NoHide
MsgBox, % Colors[CookingChoice]
Return

numpad1::
SetTimer, ForceExitApp, 20700000 ; 5 HOURS 45 MINS
Loop
{
PixelSearch, x, y, 131, 114, 150, 127, % Colors[CookingChoice], 1, Fast
if ErrorLevel
{
	Send {esc}
	Random, rand, 500, 1500
	Sleep %rand%
	Random, xlog, 636, 651
	Random, ylog, 498, 517
	Random, xspeedlog, 5, 10
	MouseMove %xlog%, %ylog%, %xspeedlog%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, xlog1, 582, 702
	Random, ylog1, 450, 463
	Random, xspeedlog1, 5, 10
	MouseMove %xlog1%, %ylog1%, %xspeedlog1%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	ExitApp
}
else
	{
	Click
	Random, rand, 500, 1500
	Sleep %rand%
	send {esc}
	Random, rand, 500, 1500
	Sleep %rand%
	Random, xfurnace, 282, 289
	Random, yfurnace, 129, 137
	Random, speed, 5, 10
	MouseMove %xfurnace%, %yfurnace%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, run, 3100, 4000
	Sleep %run%
	Random, xsmith, 229, 296
	Random, ysmith, 426, 472
	Random, speed, 5, 10
	MouseMove %xsmith%, %ysmith%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, smelt, 65000, 70000
	Sleep %smelt%
	Random, xbanker, 231, 238
	Random, ybanker, 279, 287
	Random, speed, 5, 10
	MouseMove %xbanker%, %ybanker%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, run, 3100, 4000
	Sleep %run%
	Random, xbank, 434, 455
	Random, ybank, 328, 344
	Random, speed, 5, 10
	MouseMove %xbank%, %ybank%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	Click
	Random, xgoldbar, 131, 150
	Random, ygoldbar, 114, 127
	Random, speed, 5, 10
	MouseMove %xgoldbar%, %ygoldbar%, %speed%
	Random, rand, 500, 1500
	Sleep %rand%
	}
}
return


ForceExitApp:
SetTimer,  ForceExitApp, Off
ExitApp

numpad2::exitapp