#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

SendWithModifiers(key)
{
    mods := ""
    if GetKeyState("Shift", "P")
        mods .= "+"

    if GetKeyState("Ctrl", "P")
        mods .= "^"

    if GetKeyState("LAlt", "P")
        mods .= "!"

    if GetKeyState("LWin", "P") || GetKeyState("RWin", "P")
        mods .= "#"

    Send, % mods . "{" . key . "}"
}

; RAlt + key remaps with modifier support
RAlt & i::SendWithModifiers("Up")
RAlt & j::SendWithModifiers("Left")
RAlt & k::SendWithModifiers("Down")
RAlt & l::SendWithModifiers("Right")
RAlt & u::SendWithModifiers("Home")
RAlt & o::SendWithModifiers("End")
RAlt & y::SendWithModifiers("PgUp")
RAlt & h::SendWithModifiers("PgDn")
