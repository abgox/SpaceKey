#HotIf WinActive("ahk_exe Wave.exe") && GetKeyState("w", "p")
Space & j:: SendInput("!{[}") ; 上一个 Tab
Space & l:: SendInput("!{]}") ; 下一个 Tab
Space & i:: SendInput("^+{Left}") ; 上一个 Section(块)
Space & k:: SendInput("^+{Right}") ; 下一个 Section(块)
#HotIf
