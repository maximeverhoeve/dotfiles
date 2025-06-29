#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global FnKeyDown
FnKeyDown = false

EnableFnKeyDown()
{
    FnKeyDown = true
}

DisableFnKeyDown()
{
    FnKeyDown = false
}

IsFnKeyDown()
{
    return %FnKeyDown% = true
}

IsFnKeyNotDown()
{
    return %FnKeyDown% = false
}

*RAlt::
    EnableFnKeyDown()
return

*RAlt up::
    DisableFnKeyDown()
return

#If IsFnKeyDown()
    ; arrow keys
    i::up
    j::left
    k::down
    l::right

    ; home & end
    u::home
    o::end

    ; page up & page down
    y::PgUp
    h::PgDn
    
    ; quotation marks
    [::send, “
    ]::send, ”

    ; media keys
    8::Media_Play_Pause
    9::Media_Next
    7::Media_Prev
    0::Volume_Mute
    -::Volume_Down
    =::Volume_Up
#If