SetBatchLines, -1
global stop := false

; Hotkey to start the mouse movement and click at each position: Ctrl + Shift + F6
^+F6::
    stop := false
    Gosub, StartMouseMovement
return

; Hotkey to stop the mouse movement: Ctrl + Shift + F7
^+F7::
    stop := true
return

StartMouseMovement:
    CoordMode, Mouse, Screen

    ; Starting position and dimensions
    xStart := 500
    yStart := 300
    width := 1120
    height := 580
    step := 10  ; Adjust step size as needed

    xSteps := Floor(width / step)
    ySteps := Floor(height / step)

    Loop, % xSteps
    {
        if (stop)
            return

        xIndex := A_Index
        x := xStart + (xIndex - 1) * step

        Loop, % ySteps
        {
            if (stop)
                return

            yIndex := A_Index
            y := yStart + (yIndex - 1) * step

            MouseMove, %x%, %y%, 0

            Click
        }
    }
return