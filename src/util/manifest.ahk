#Requires AutoHotkey v2.0
;@AHK2Exe-SetName SpaceKey
;@Ahk2Exe-SetOrigFilename SpaceKey.ahk
;@Ahk2Exe-SetMainIcon icon/app.ico
;@Ahk2Exe-SetCopyright Copyright (c) 2025-present abgox
;@AHK2Exe-SetDescription abgox.SpaceKey - abgox 的按键映射方案
;@Ahk2Exe-UpdateManifest 1
#SingleInstance Force
#Warn All, Off

Persistent()
ListLines(0)
KeyHistory(5)

OnMessage(0x404, (wParam, lParam, *) => lParam == 0x202 ? (
    A_IsPaused ? TraySetIcon(A_ScriptDir "/icon/app.png", , 1) : TraySetIcon(A_ScriptDir "/icon/app-pause.png", , 1),
    Suspend(-1), Pause(-1)
) : "")

OnError(LogError)
LogError(exception, mode) {
    try {
        FileDelete(A_ScriptDir "\temp\key.ahk")
        Run('"' A_AhkPath '" "' A_ScriptFullPath '"')
        return false
    } catch {
        return true
    }
}

fileDesc := "SpaceKey - abgox 的按键映射方案"

A_IconTip := fileDesc

TraySetIcon("icon/app.png", , 1)
