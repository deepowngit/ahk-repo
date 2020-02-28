;
; Small function to check red clicks written by Something's Nothing#6228
;
RedClickCheck()
{
    RedStart := A_TickCount
    Loop
    {
        MouseGetPos, MosPosX, MosPosY
        PixelGetColor, PixelColor, MosPosX, MosPosY
        If (PixelColor = 0x0000FF)
            Return 0
        Else If (A_TickCount - RedStart >= 500)
            Return 1
    }
}
