#Requires AutoHotkey v2.0
;@AHK2Exe-SetName SpaceKey
;@Ahk2Exe-SetOrigFilename SpaceKey.ahk
;@Ahk2Exe-SetMainIcon icon/app.ico
;@Ahk2Exe-SetCopyright Copyright (c) 2025-present abgox
;@AHK2Exe-SetDescription abgox.SpaceKey - abgox 的按键输入方案
;@Ahk2Exe-UpdateManifest 1
#SingleInstance Force
#Warn All, Off

Persistent
ListLines 0
KeyHistory 5

fileDesc := "SpaceKey - abgox 的按键输入方案"

A_IconTip := fileDesc

TraySetIcon("icon/app.png", , 1)
