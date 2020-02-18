;small easy randomiser if u want to put "anti-bot measures" in your scripts
;This small example was used on how I wanted my mouse to move while dropping my inventory.
; 
        Random, dropChoice, 1, 3
        if (dropChoice = 1)
        {
        drop2()
        }
        else if (dropChoice = 2)
        {
        drop4()
        }
        else if (dropChoice = 3)
        {
        drop12()
        }
