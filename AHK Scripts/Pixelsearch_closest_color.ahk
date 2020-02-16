centerX := A_ScreencenterX/2
centerY := A_ScreencenterY/2
;
;
;
;
;                                           - written by nomivore#8437 -
;        - target the closest npc/object/loot, works with any npc, item or object. The loop gradually increases 
;                     search radius from the center and exits the loop once pixel is found. -
;
1::
CoordMode, Pixel, Window
Loop, 50
{
PixelSearch, FoundX, FoundY, % centerX-A_Index*20, % centerY-A_Index*20, % centerX+A_Index*20-1, % centerY+A_Index*20-1, 0x00FFFF, 0, Fast RGB
    If (ErrorLevel = 0) {
        Random, rand, -10, 10
        FoundX += %rand%
        Random, rand, -10, 10
        FoundY += %rand%
        Click, %FoundX%, %FoundY% Left, 0
        Sleep, 120
        Click, %FoundX%, %FoundY% Left, 1
        return
    }
}
return

2::
mousegetpos, centerX, centerY
return
