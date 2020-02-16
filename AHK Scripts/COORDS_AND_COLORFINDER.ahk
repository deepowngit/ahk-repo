#singleinstance force
#Persistent
;
;
;                 - written originally by me, edited a little by Redemption#0001 -
;    - Using Numpad9 will also put the color code to your clipboard, so you can just ctrl +v -
;
if 1    ; screen coordinates
    coord=relative
else
    coord=relative
tooltip, %coord%
sleep, 10

CoordMode, ToolTip, %coord%
CoordMode, Pixel, %coord%
CoordMode, Mouse, %coord%
CoordMode, Caret, %coord%
CoordMode, Menu, %coord%

SetTimer, WatchCursor, 10
return

WatchCursor:
WinGetTitle, window, A
MouseGetPos,xpos , ypos 
PixelGetColor, color, %xpos%, %ypos%
ToolTip,Active Window: %window% `nCords: x%xpos% y%ypos%`nColor: %color%
return

Esc::exitapp

Numpad9::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
;Can remove or comment out the Msgbox out so it'll instantly copy to your clipboard instead of dealing with the popup.
MsgBox, The color at the current cursor position is %color%. `nIt has been copied to your clipboard.
clipboard := color
return

f12::reload
