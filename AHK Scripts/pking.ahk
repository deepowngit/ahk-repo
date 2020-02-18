Gui, +AlwaysOnTop -SysMenu +Owner  ; +Owner avoids a taskbar button.
Gui, Add, Text,,0= ice barrage 1=switchgear 2=bottomleftspec 3=GMAUL 4=mage 5=range 6=melee 7=next-tobottomleft
Gui, Show, NoActivate, pking  ; NoActivate avoids deactivating the currently active window.
;
;
;   script is old but should work somewhat fine, easy to do modifications
;
Numpad7::
;CLAWS TO GMAUL
BlockInput, On
MouseGetPos, xpos, ypos
SendInput {Esc}
Sleep 10
MouseMove, 1775, 980, 0
Click
SendInput {F1}
Sleep 50
MouseMove 1800, 957, 0
Sleep 100
Click
MouseMove, %xpos%, %ypos%, 0
BlockInput, Off
return

Numpad1::
;4-WAY SWITCH FIRST 4 SLOTS
BlockInput, On
MouseGetPos, xpos, ypos
MouseMove, 1732, 763, 0
Click
MouseMove, 1775, 767, 0
Click
MouseMove 1731, 803, 0
Click
MouseMove 1776, 801, 0
Click
MouseMove, %xpos%, %ypos%, 0
BlockInput, Off
return

Numpad2::
;Spec-weap bottom left corner
BlockInput, On
MouseGetPos, xpos, ypos
SendInput {F5}
MouseMove 1876, 845, 0
Click
MouseMove 1729, 879, 0
Click
Sleep 10
SendInput {Esc}
Sleep 10
MouseMove 1737, 979, 0
Click
SendInput {F1}
Sleep 50
MouseMove 1800, 957, 0
Click
SendInput {Esc}
MouseMove, %xpos%, %ypos%, 0
BlockInput, Off
return

Numpad3::
;Spec-weap bottom left corner
BlockInput, On
MouseGetPos, xpos, ypos
SendInput {F5}
MouseMove 1876, 845, 0
Click
MouseMove 1729, 879, 0
Click
SendInput {Esc}
Sleep 10
MouseMove 1737, 979, 0
Click
SendInput {F1}
Sleep 10
MouseMove 1800, 957, 0
Click
Sleep 10
Click
Sleep 10
Click
Sleep 20
Click
Click
MouseMove, %xpos%, %ypos%, 0
BlockInput, Off
return

Numpad4::
;PRAY MAGE
BlockInput, On
MouseGetPos, xpos, ypos
SendInput {F5}
MouseMove, 1763, 877, 0
Click
MouseMove, %xpos%, %ypos%, 0
SendInput {Esc}
BlockInput, Off
return

Numpad5::
;PRAY RANGE
BlockInput, On
MouseGetPos, xpos, ypos
SendInput {F5}
MouseMove, 1800, 882, 0
Click
MouseMove, %xpos%, %ypos%, 0
SendInput {Esc}
BlockInput, Off
return

Numpad6::
;PRAY MELEE
BlockInput, On
MouseGetPos, xpos, ypos
SendInput {F5}
MouseMove, 1830, 874, 0
Click
MouseMove, %xpos%, %ypos%, 0
SendInput {Esc}
BlockInput, Off
return

Numpad0::
;ICE BARRAGE INSTANT
BlockInput, On
MouseGetPos, xpos, ypos
SendInput {F6}
MouseMove, 1725, 970, 0
Click
MouseMove, %xpos%, %ypos%, 0
SendInput {Esc}
BlockInput, Off
return
