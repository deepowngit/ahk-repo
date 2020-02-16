#SingleInstance Force

/*
RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
*/

/*
INSTRUCTIONS         SCRIPT WRITTEN BY Rehz#9094
---------------------------------------------------
mark duel ring purple
mark binding neck green
gpu on, distance:35
north, bird's eye view, zoom all the way out
dueling ring in 1st bank slot
binding necklaces in 2nd bank slot
pure essence in 3rd bank slot
1 dose staminas in 4th bank slot
brightness all the way up
start with empty pouches
start with no lava runes in backpack
tele to crafting guild with cape and start in that spot
-------------------------------------------------
*/

Wait() ; use before every Click command
{
	Random, sleeptime, 30, 100
	Sleep sleeptime
}
Reaction()
{
    random, sleeptime, 50, 100
    sleep sleeptime
}

Ctrl::
toggle := !toggle
Loop
{
    if !toggle
    {
        break
    }
    else
	{
		GoTo, activate
	}
	
activate:
WinActivate, ahk_class SunAwtFrame
Sleep 500
GoTo, geartab

geartab: ; opens gear tab
Send, {F4 1} ; goes to gear tab
GoTo, geartabopenwait

geartabopenwait:
pixelsearch, x, y, 666, 198, 690, 223, 0x181E5A, 1, Fast
if errorlevel
GoTo, geartabopenwait
else
{
    Reaction()
    GoTo, gearcheckduelingring
}

gearcheckduelingring: ; checks if you have dueling ring equipped
pixelsearch, x, y, 669, 381, 733, 435, 0xFF00FF, 1, Fast ; looks for purple marked duel ring in ring slot
if ErrorLevel
{
    random, sleeptime, 50, 100
    sleep sleeptime
    Send, {Esc 1} ; goes to backpack tab
    random, sleeptime, 50, 100
    sleep sleeptime
    GoTo, duelingringruntobankchest
}
else
GoTo, gearcheckbindingnecklace

duelingringruntobankchest: ; clicks bank chest from marked tile at crafting guild
pixelsearch, x, y, 249, 225, 425, 332, 0x00FFFF, 1, Fast ; looks for bank chest 335 278
if ErrorLevel
{
    msgbox, did not find bank chest. please make sure it is marked.
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, randx, 4, 9
    random, randy, 5, 10
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, duelingringbankinterfacewait
}

duelingringbankinterfacewait: ; wait for bank interface to pop up
pixelsearch, x, y, 189, 39, 333, 61, 0x1F98FF, 1, Fast ; looks for orange bank text at top
if ErrorLevel
GoTo, duelingringbankinterfacewait
else
{
    Reaction()
    GoTo, duelingringwithdraw
}

duelingringwithdraw: ; withdraws a dueling ring from bank
pixelsearch, x, y, 65, 107, 110, 144, 0x159511, 1, Fast
if ErrorLevel
{
    msgbox, you have run out of dueling rings.
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, movex, 84, 97
    random, movey, 116, 130
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click Right
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 38, 44
    mousemove, 0, %n%, 2, R
    Wait()
    Click ; clicks withdraw 1 dueling ring
    GoTo, duelingringwithdrawwait
}
duelingringwithdrawwait: ; waits for dueling ring to appear in backpack
pixelsearch, x, y, 558, 233, 737, 482, 0xFF00FF, 1, Fast
if ErrorLevel
GoTo, duelingringwithdrawwait
else
{
    Reaction()
    GoTo, equipnewduelingring
}

equipnewduelingring:
pixelsearch, x, y, 558, 233, 737, 482, 0xFF00FF, 1, Fast ; looks for dueling ring in backpack 629 244
if ErrorLevel
{
    msgbox, did not find dueling ring in backpack. make sure it is marked group4/purple.
    ExitApp
}
else
{
    Send, {Esc 1} ; closes bank interface
    GoTo, equipnewduelringbankclosewait
}
equipnewduelringbankclosewait:
pixelsearch, x, y, 199, 41, 332, 60, 0x1F98FF, 1, Fast
if errorlevel
    GoTo, actuallyequipnewduelingring
else
    GoTo, equipnewduelringbankclosewait

actuallyequipnewduelingring:
pixelsearch, x, y, 558, 233, 735, 282, 0xFF00FF, 1, Fast
if ErrorLevel
{
    msgbox, did not find dueling ring in backpack. make sure it is tagged group 4/purple.
    exitapp
}
else
{
    Reaction()
    mousegetpos, MouseX, MouseY
    random, speed, 250, 400
    random, randx, -9, 0
    random, randy, 9, 16
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click right ; right clicks dueling ring in backpack
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 54, 58
    mousemove, 0, %n%, 2, R
    Wait()
    Click ; clicks wear dueling ring
    random, sleeptime, 50, 100
    sleep sleeptime
    GoTo, equipnewduelingringwait
}
equipnewduelingringwait: ; waits for dueling ring to be equipped
pixelsearch, x, y, 553, 234, 734, 485, 0xFF00FF, 1, Fast
if ErrorLevel
{
    Reaction()
    GoTo, gearcheckbindingnecklace
}
else
GoTo, equipnewduelingringwait

gearcheckbindingnecklace: ; checks if you have binding necklace equipped
Send, {F4 1} ; goes to gear tab
GoTo, geartabopenwait2

geartabopenwait2:
pixelsearch, x, y, 666, 198, 690, 223, 0x181E5A, 1, Fast
if errorlevel
GoTo, geartabopenwait2
else
{
    Reaction()
    GoTo, geartabopenwait2decide
}

geartabopenwait2decide:
pixelsearch, x, y, 617, 265, 675, 314, 0x00FF00, 1, Fast
if ErrorLevel
{
    Reaction()
    Send, {Esc 1} ; goes to backpack tab
    Reaction()
    GoTo, getnewbindingnecklace
}
else
{
    Reaction()
    Send, {Esc 1} ; goes to backpack tab
    GoTo, fillpouchesbankchest
}

getnewbindingnecklace: ; looks for bank chest 279 190
pixelsearch, x, y, 229, 181, 318, 254, 0x00FFFF, 1, Fast
if ErrorLevel
{
    msgbox, did not find bank chest. plase make sure it is marked.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, randx, -5, -3
    random, randy, 7, 10
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, bindingnecklacebankinterfacewait
}

bindingnecklacebankinterfacewait: ; waits for bank interface to pop up
pixelsearch, x, y, 189, 39, 333, 61, 0x1F98FF, 1, Fast ; looks for orange bank text at top
if ErrorLevel
GoTo, bindingnecklacebankinterfacewait
else
{
    Reaction()
    GoTo, bindingnecklacewithdraw
}

bindingnecklacewithdraw: ; withdraws 1 binding necklace
pixelsearch, x, y, 117, 108, 160, 156, 0x62A815, 1, Fast
if ErrorLevel
{
    msgbox, you are out of binding necklaces.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, movex, 132, 141
    random, movey, 118, 133
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click right ; right clicks binding necklace in 2nd bank slot
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 40, 44
    mousemove, 0, %n%, 2, R
    Wait()
    Click ; click withdraw 1 binding necklace
    GoTo, bindingnecklacewithdrawwait
}

bindingnecklacewithdrawwait: ; waits for binding necklace to appear in backpack
pixelsearch, x, y, 558, 233, 737, 482, 0x00FF00, 1, Fast 
if ErrorLevel
GoTo, bindingnecklacewithdrawwait
else
{
    Reaction()
    Send, {Esc 1} ; closes bank interface
    GoTo, bindingnecklacewithdrawbankclosewait
}
bindingnecklacewithdrawbankclosewait:
pixelsearch, x, y, 163, 40, 358, 60, 0x1F98FF, 1, Fast
if errorlevel
{
    Reaction()
    GoTo, equipnewbindingnecklace
}
else
    GoTo, bindingnecklacewithdrawbankclosewait

equipnewbindingnecklace: ; equips binding necklace in backpack
pixelsearch, x, y, 558, 233, 737, 482, 0x00FF00, 1, Fast ; 619 240
if ErrorLevel
{
    msgbox, did not find binding necklace in backpack. make sure it is marked group 2/green
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 250, 400
    random, randx, -1, 8
    random, randy, 6, 13
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5") 
    Wait()
    Click ; click equip binding necklace in backpack
    random, sleeptime, 50, 100
    sleep sleeptime
    GoTo, equipnewbindingnecklacewait
}

equipnewbindingnecklacewait: ; waits for binding necklace to be equipped
pixelsearch, x, y, 558, 233, 737, 482, 0x00FF00, 1, Fast ; 619 240
if ErrorLevel
{
    Reaction()
    GoTo, fillpouchesbankchest2
}
else
GoTo, equipnewbindingnecklacewait

fillpouchesbankchest: ; clicks bank chest
pixelsearch, x, y, 260, 228, 435, 339, 0x00FFFF, 1, Fast
if ErrorLevel
{
    msgbox, did not find bank chest. plase make sure it is marked.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, randx, 4, 9
    random, randy, 5, 10
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, fillpouchesbankinterfacewait
}

fillpouchesbankchest2:
pixelsearch, x, y, 229, 181, 318, 254, 0x00FFFF, 1, Fast
if ErrorLevel
{
    msgbox, did not find bank chest. make sure it is marked.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, randx, -5, -3
    random, randy, 7, 10
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, fillpouchesbankinterfacewait
}
fillpouchesbankinterfacewait: ; waits for bank interface to pop up
pixelsearch, x, y, 189, 39, 333, 61, 0x1F98FF, 1, Fast ; looks for orange bank text at top
if ErrorLevel
GoTo, fillpouchesbankinterfacewait
else
{
    Reaction()
    GoTo, withdrawpureessence
}

withdrawpureessence: ; checks for pure essence in 3rd bank slot
pixelsearch, x, y, 163, 107, 207, 142, 0x7A7A84, 1, Fast
if ErrorLevel
{
    msgbox, you are out of pure essence.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 250, 350
    random, movex, 179, 198
    random, movey, 116, 132
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click ; withdraws pure essence from 3rd bank slot
    GoTo, withdrawpureessencewait
}

withdrawpureessencewait: ; waits for pure essence to appear in backpack
pixelsearch, x, y, 685, 453, 729, 489, 0x7A7A84, 1, Fast
if ErrorLevel
GoTo, withdrawpureessencewait
else
{
    Reaction()
    GoTo, filllargepouch
}

filllargepouch: ; fills medium pouch with pure essence
mousegetpos, MouseX, MouseY
random, speed, 250, 450
random, movex, 575, 589
random, movey, 255, 264
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click right ; right clicks medium pouch
random, sleeptime, 100, 200
sleep sleeptime
random, n, 129, 133
mousemove, 0, %n%, 2, R
Wait()
Click ; clicks fill medium pouch
random, sleeptime, 50, 100
sleep sleeptime
GoTo, filllargepouchwait

filllargepouchwait: ; waits for pure essence to be put in medium pouch
pixelsearch, x, y, 560, 344, 600, 382, 0x7A7A84, 1, Fast
if ErrorLevel
{
    Reaction()
    GoTo, fillgiantpouch
}
else
GoTo, filllargepouchwait

fillgiantpouch: ; fills large pouch with pure essence
mousegetpos, MouseX, MouseY
random, speed, 100, 200
random, movex, 575, 587
random, movey, 289, 300
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click right ; right clicks large pouch
random, sleeptime, 100, 200
sleep sleeptime
random, n, 129, 133
mousemove, 0, %n%, 2, R
Wait()
Click ; clicks fill large pouch
random, sleeptime, 50, 100
sleep sleeptime
GoTo, fillgiantpouchwait

fillgiantpouchwait:
pixelsearch, x, y, 603, 346, 642, 381, 0x7A7A84, 1, Fast
if ErrorLevel
{
    random, sleeptime, 200, 400
    sleep sleeptime
    Goto, giantpouchdegradecheck
}
else
GoTo, fillgiantpouchwait

giantpouchdegradecheck:
pixelsearch, x, y, 558, 270, 608, 312, 0x30303C, 1, Fast
if ErrorLevel
GoTo, withdrawmorepureessence
else
{
    Send, {Esc 1}
    random, sleeptime, 200, 400
    sleep sleeptime
    GoTo, repairpouches
}

withdrawmorepureessence: ; withdraws more pure essence after filling pouches
pixelsearch, x, y, 163, 107, 207, 142, 0x7A7A84, 1, Fast
if ErrorLevel
{
    msgbox, you are out of pure essence.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 250, 400
    random, movex, 179, 198
    random, movey, 116, 132
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click ; withdraws pure essence from 3rd bank slot
    GoTo, withdrawmorepureessencewait
}

withdrawmorepureessencewait: ; waits for more pure essence to be withdrawn after filling pouches
pixelsearch, x, y, 644, 381, 688, 416, 0x7A7A84, 1, Fast
if ErrorLevel
    GoTo, withdrawmorepureessencewait
else
{
    Reaction()
    Send, {Esc 1}
    GoTo, withdrawmorepureessencewaitbankclose
}
withdrawmorepureessencewaitbankclose:
pixelsearch, x, y, 162, 41, 367, 60, 0x1F98FF, 1, Fast
if errorlevel
{
    Reaction()
    GoTo, duelarenateleportgeartab
}
else
    GoTo, withdrawmorepureessencewaitbankclose

withdrawmorepureessencebank:
mousegetpos, MouseX, MouseY
random, speed, 300, 500
random, movex, 618, 631
random, movey, 254, 263
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click Down
mousegetpos, MouseX, MouseY
random, speed, 200, 350
random, movex, 579, 592
random, movey, 290, 298
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click Up ; moves giant pouch back under large pouch
random, sleeptime, 200, 300
sleep sleeptime
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
pixelsearch, x, y, 203, 161, 389, 285, 0x00FFFF, 1, Fast ; 272 208
if errorlevel
{
    msgbox, did not find bank chest. plase make sure it's marked.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, randx, -5, -9 
    random, randy, 1, 4
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, withdrawmorepureessencebankwait
}

withdrawmorepureessencebankwait:
pixelsearch, x, y, 189, 39, 333, 61, 0x1F98FF, 1, Fast ; looks for orange bank text at top
if ErrorLevel
GoTo, withdrawmorepureessencebankwait
else
{
    Reaction()
    GoTo, fillgiantpouch
}

duelarenateleportgeartab:
Send, {F4 1}
GoTo, duelarenateleportgeartabwait

duelarenateleportgeartabwait:
pixelsearch, x, y, 666, 199, 691, 226, 0x181E5A, 1, Fast
if errorlevel
    GoTo, duelarenateleportgeartabwait
else
{
    Reaction()
    mousegetpos, MouseX, MouseY
    random, speed, 200, 300
    random, movex, 691, 710
    random, movey, 400, 419
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click right ; right clicks dueling ring in gear tab
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 40, 43
    mousemove, 0, %n%, 2, R
    Wait()
    Click ; click teleport to duel arena
    random, sleeptime, 50, 100
    sleep sleeptime
    GoTo, duelarenateleportwait
}

duelarenateleportwait: ; waits until you've teleported to the duel arena
pixelsearch, x, y, 600, 58, 695, 122, 0x5152CB, 1, Fast
if errorlevel
GoTo, duelarenateleportwait
else
{
    Reaction()
    GoTo, openmagictab
}

openmagictab: ; opens magic tab
Send, {F6 1}
random, sleeptime, 50, 100
sleep sleeptime
GoTo, movecameradown

movecameradown: ; moves camera down
Send, {Down Down}
random, sleeptime, 1100, 1200
sleep sleeptime
Send, {Down Up}
GoTo, entermysteriousruins

entermysteriousruins: ; enters mysterious ruins
pixelsearch, x, y, 195, 121, 301, 148, 0x00FFFF, 1, Fast ; looks for marked mysterious ruins 272 121
if errorlevel
{
	msgbox, Did not find altar.
	ExitApp
}
else
{
mousegetpos, MouseX, MouseY
random, speed, 300, 450
random, randx, -10, -15
random, randy, 0, 3
RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
Wait()
Click ; clicks marked altar ; clicks mysterious ruins
Reaction()
GoTo, adjustcamerawhilerunning
}

adjustcamerawhilerunning: ; moves camera back up
Send, {Up Down}
random, sleeptime, 1500, 1700
sleep sleeptime
Send, {Up Up}
GoTo, entermysteriousruinswait

entermysteriousruinswait: ; waits until you've entered mysterious ruins
pixelsearch, x, y, 588, 54, 706, 122, 0x1A9BE2, 1, Fast
if ErrorLevel
GoTo, entermysteriousruinswait
else
{
    Reaction()
    GoTo, movetowardaltar
}

movetowardaltar: ; clicks marked tile inside mysterious ruins
pixelsearch, x, y, 342, 250, 516, 362, 0x00FFFF, 1, Fast ; 458 330
if ErrorLevel
{
    msgbox, did not find marked tile.
    exitapp
}
else
{
mousegetpos, MouseX, MouseY
random, speed, 250, 350
random, randx, -3, -15
random, randy, 4, 13
RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
Wait()
Click ; clicks marked tile
random, sleeptime, 5000, 5500
sleep sleeptime
GoTo, castmagicimbue
}

castmagicimbue:
mousegetpos, MouseX, MouseY
random, speed, 250, 350
random, movex, 640, 650
random, movey, 374, 381
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click ; clicks magic imbue spell
GoTo, magicimbuecastwait

magicimbuecastwait:
pixelsearch, x, y, 390, 84, 517, 322, 0xFFFFFF, 1, Fast ; looks for white xp drop
if ErrorLevel
    GoTo, magicimbuecastwait
else
{
    Reaction()
    GoTo, useearthrunes
}

useearthrunes:
Send, {Esc 1} ; goes to backpacktab
GoTo, earthrunebackpackwait

earthrunebackpackwait:
pixelsearch, x, y, 633, 199, 659, 226, 0x20297A, 1, Fast
if errorlevel
    GoTo, earthrunebackpackwait
else
{
    Reaction()
    mousegetpos, MouseX, MouseY
    random, speed, 200, 350
    random, movex, 573, 589
    random, movey, 320, 334
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click ; clicks earth runes
    Reaction()
    GoTo, craftlavas1
}
craftlavas1: ; clicks on altar
pixelsearch, x, y, 212, 218, 386, 304, 0x00FFFF, 1, Fast ; 301 226
if ErrorLevel
{
    msgbox, did not find altar
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 250, 350
    random, randx, -11, -33
    random, randy, -11, 4
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks altar
    GoTo, craftlavas1wait
}

craftlavas1wait: ; waits until lava runes are crafted
pixelsearch, x, y, 686, 455, 728, 488, 0x7A7A84, 1, Fast ; looks for pure essence in last backpack slot
if ErrorLevel
{
    Reaction()
    GoTo, emptylargepouch
}
else
    GoTo, craftlavas1wait

emptylargepouch:
Send, {Shift Down}
random, sleeptime, 50, 100
sleep sleeptime
mousegetpos, MouseX, MouseY
random, speed, 230, 350
random, movex, 577, 586
random, movey, 257, 262
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click ; clicks empty medium pouch
GoTo, emptylargepouchwait

emptylargepouchwait: ; waits until medium pouch is emptied
pixelsearch, x, y, 602, 345, 643, 382, 0x7A7A84, 1, Fast 
if ErrorLevel
GoTo, emptylargepouchwait
else
{
    Reaction()
    GoTo, emptygiantpouch
}

emptygiantpouch:
mousegetpos, MouseX, MouseY
random, speed, 50, 100
random, movex, 576, 589
random, movey, 290, 300
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click ; clicks empty large pouch
GoTo, emptygiantpouchwait

emptygiantpouchwait: ; waits until large pouch is emptied
pixelsearch, x, y, 645, 417, 686, 453, 0x7A7A84, 1, Fast
if ErrorLevel
GoTo, emptygiantpouchwait
else
{
    Reaction()
    Send, {Shift Up}
    random, sleeptime, 50, 100
    sleep sleeptime
    GoTo, useearthrunes2
}

useearthrunes2:
mousegetpos, MouseX, MouseY
random, speed, 50, 150
random, movex, 573, 589
random, movey, 320, 334
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click ; clicks earth runes
Reaction()
GoTo, craftlavas2

craftlavas2: ; clicks on altar
pixelsearch, x, y, 212, 218, 386, 304, 0x00FFFF, 1, Fast ; 301 226
if ErrorLevel
{
    msgbox, did not find altar
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 250, 350
    random, randx, -11, -33
    random, randy, -11, 4
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks altar
    GoTo, craftlavas2wait
}

craftlavas2wait: ; waits until lava runes are crafted
pixelsearch, x, y, 644, 417, 688, 452, 0x7A7A84, 1, Fast ; looks for pure ess in backpack
if ErrorLevel
{
    Reaction()
    GoTo, teleportcraftingguild
}
else
    GoTo, craftlavas2wait

teleportcraftingguild:
Send, {F4 1}
random, sleeptime, 200, 300
sleep sleeptime
mousegetpos, MouseX, MouseY
random, speed, 250, 400
random, movex, 594, 614
random, movey, 281, 304
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click right ; right clicks craft skill cape in gear tab
random, sleeptime, 100, 200
sleep sleeptime
random, n, 55, 58
mousemove, 0, %n%, 2, R
Wait()
Click ; clicks teleport to crafting guild
random, sleeptime, 100, 200
sleep sleeptime
Send, {Esc 1}
GoTo, teleportcraftingguildwait

teleportcraftingguildwait: ; waits until you've teleported to the crafting guild
pixelsearch, x, y, 128, 98, 375, 305, 0x6F6F77, 1, Fast
if errorlevel
GoTo, teleportcraftingguildwait
else
{
    Reaction()
    GoTo, pouchdegradecheck
}

pouchdegradecheck: ; checks if large pouch degraded
pixelsearch, x, y, 555, 270, 602, 308, 0x4A616E, 1, Fast
if ErrorLevel
{
    Reaction()
    GoTo, repairpouches
}
else
GoTo, lavarunedrop

lavarunedrop:
mousegetpos, MouseX, MouseY
random, speed, 250, 350
random, movex, 613, 632
random, movey, 246, 264
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Send, {Shift Down}
random, sleeptime, 50, 100
sleep sleeptime
Click 
random, sleeptime, 50, 100
sleep sleeptime
Send, {Shift Up}
random, sleeptime, 50, 100
sleep sleeptime
GoTo, runenergycheck

runenergycheck: ; checks if run energy at 70
pixelsearch, x, y, 564, 145, 565, 146, 0x131313, 1, Fast
if errorlevel
GoTo, geartab
else
GoTo, staminabank

staminabank: ; runs to bank chest
pixelsearch, x, y, 249, 225, 425, 332, 0x00FFFF, 1, Fast ; looks for bank chest 335 278
if ErrorLevel
{
    msgbox, did not find bank chest. please make sure it is marked.
    ExitApp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, randx, 4, 9
    random, randy, 5, 10
    RandomBezier( MouseX, MouseY, x+randx, y+randy, "T"speed "P2-5")
    Wait()
    Click ; clicks bank chest
    GoTo, staminabankwait
}

staminabankwait: ; waits until bank interface pops up
pixelsearch, x, y, 202, 38, 339, 62, 0x1F98FF, 1, Fast
if errorlevel
GoTo, staminabankwait
else
{
    Reaction()
    GoTo, withdraw1dosestamina
}

withdraw1dosestamina: ; withdraws a 1 dose stamina from 4th bank slot
pixelsearch, x, y, 213, 108, 256, 149, 0x3A6280, 1, Fast
if errorlevel
{
    msgbox, you have run out of 1 dose staminas.
    exitapp
}
else
{
    mousegetpos, MouseX, MouseY
    random, speed, 300, 500
    random, movex, 230, 242
    random, movey, 125, 136
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click right
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 40, 43
    mousemove, 0, %n%, 2, R
    Wait()
    Click ; withdraws a 1 dose stamina
    GoTo, withdraw1dosestaminawait
}

withdraw1dosestaminawait:
pixelsearch, x, y, 560, 234, 683, 285, 0x3A6280, 1, Fast
if errorlevel
GoTo, withdraw1dosestaminawait
else
{
    Reaction()
    Send, {Esc 1} ; exits bank interface
    random, sleeptime, 200, 400
    sleep sleeptime
    GoTo, drink1dosestamina
}

drink1dosestamina:
mousegetpos, MouseX, MouseY
random, speed, 300, 600
random, movex, 618, 629
random, movey, 256, 266
RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
Wait()
Click
Random, sleeptime, 3000, 3200
sleep sleeptime
GoTo, drankstaminareset

drankstaminareset:
Send, {F4 1}
GoTo, drankstaminaresetwait

drankstaminaresetwait:
pixelsearch, x, y, 666, 199, 690, 222, 0x181E5A, 1, Fast
if errorlevel 
    GoTo, drankstaminaresetwait
else
{
    Reaction()
    mousegetpos, MouseX, MouseY
    random, speed, 200, 350
    random, movex, 594, 614
    random, movey, 281, 304
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click right ; right clicks crafting skill cape in gear tab
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 55, 58
    mousemove, 0, %n%, 2, R
    Wait()
    Click ; clicks teleport to crafting guild
    random, sleeptime, 100, 200
    sleep sleeptime
    Send, {Esc 1}
    random, sleeptime, 3000, 3200
    sleep sleeptime
    GoTo, geartab
}

repairpouches:
Send, {F6 1}
GoTo, repairpoucheswait

repairpoucheswait:
pixelsearch, x, y, 732, 199, 755, 226, 0x1B246B, 1, Fast
if errorlevel
    GoTo, repairpoucheswait
else
{
    Reaction()
    mousegetpos, MouseX, MouseY
    random, speed, 300, 600
    random, movex, 561, 570
    random, movey, 266, 272
    RandomBezier( MouseX, MouseY, movex, movey, "T"speed "P2-5")
    Wait()
    Click right ; right clicks npc contact spell
    random, sleeptime, 100, 200
    sleep sleeptime
    random, n, 39, 42
    mousemove, 0, %n%, 2, R
    Wait()
    Click ; clicks dark mage option
    GoTo, darkmagecontactwait
}

darkmagecontactwait: ; waits until dark mage talks to you
pixelsearch, x, y, 14, 376, 135, 489, 0x111115, 1, Fast
if ErrorLevel
GoTo, darkmagecontactwait
else
{
    random, sleeptime, 1000, 1500
    sleep sleeptime
    Send, {Space 1}
    random, sleeptime, 2000, 2200
    sleep sleeptime
    Send, {Space 1}
    random, sleeptime, 2000, 2200
    sleep sleeptime
    Send, {Space 1}
    Random, sleeptime, 2000, 200
    sleep sleeptime
    Send, {Esc 1}
    random, sleeptime, 300, 400
    sleep sleeptime
    GoTo, withdrawmorepureessencebank
}

} ; ends infinite loop
*Esc::ExitApp
return


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
