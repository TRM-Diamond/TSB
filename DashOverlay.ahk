
DashKey := "q"


CooldownSide      := 2000   ; 
CooldownFrontBack := 5000   ; 


BarWidth       := 220
BarHeight      := 12
Spacing        := 6
GuiWidth       := BarWidth + 20
TotalHeight    := 2*BarHeight + Spacing + 30
GuiX           := A_ScreenWidth//2 - GuiWidth//2
GuiY           := 25

ColorSideBg    := "404040"
ColorFBBg      := "404040"
ColorSide      := "00BFFF"
ColorFB        := "32CD32"
Transparency   := 120  


Gui, +AlwaysOnTop +ToolWindow -Caption +E0x08000000 +LastFound
Gui, Color, 000000
Gui, Margin, 10, 6
Gui, Font, s8 cWhite, Segoe UI

Gui, Add, Text, x10 y5 w%BarWidth% Center vTextSide, SIDE DASH
Gui, Add, Progress, x10 y+2 w%BarWidth% h%BarHeight% Background%ColorSideBg% vBarSide c%ColorSide%, 100
Gui, Add, Text, x10 y+8 w%BarWidth% Center vTextFB, FRONT/BACK DASH
Gui, Add, Progress, x10 y+2 w%BarWidth% h%BarHeight% Background%ColorFBBg% vBarFB c%ColorFB%, 100

Gui, Show, x%GuiX% y%GuiY% w%GuiWidth% h%TotalHeight% NoActivate, TSB Dash Overlay
WinSet, Transparent, %Transparency%, TSB Dash Overlay


sideReady      := 1
frontBackReady := 1
sideStart      := 0
fbStart        := 0


SetTimer, UpdateBars, 50

isRobloxActive() {
    WinGetTitle, title, A
    if InStr(title, "Roblox")
        return true
    return false
}


Hotkey, ~%DashKey%, DashActivate, On
Return   

DashActivate:
    
    sidePressed := GetKeyState("a", "P") || GetKeyState("d", "P")
    backPressed := GetKeyState("s", "P")

    if (sidePressed) {
        
        if (sideReady) {
            sideReady := 0
            sideStart := A_TickCount
        }
    } else {
        
        if (frontBackReady) {
            frontBackReady := 0
            fbStart := A_TickCount
        }
    }
Return


UpdateBars:
    now := A_TickCount

    
    if (!sideReady) {
        elapsed := now - sideStart
        if (elapsed >= CooldownSide) {
            sideReady := 1
            GuiControl,, BarSide, 100
        } else {
            pct := Round(100 * elapsed / CooldownSide)
            GuiControl,, BarSide, %pct%
        }
    } else {
        GuiControl,, BarSide, 100
    }

    
    if (!frontBackReady) {
        elapsed := now - fbStart
        if (elapsed >= CooldownFrontBack) {
            frontBackReady := 1
            GuiControl,, BarFB, 100
        } else {
            pct := Round(100 * elapsed / CooldownFrontBack)
            GuiControl,, BarFB, %pct%
        }
    } else {
        GuiControl,, BarFB, 100
    }
Return

Insert::ExitApp