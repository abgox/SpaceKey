#HotIf WinActive("ahk_exe WindowsTerminal.exe") && GetKeyState("w", "p")
Space & j:: SendInput("^+{tab}")
Space & l:: SendInput("^{tab}")
Space & c:: SendInput("^+{w}")
Space & n:: SendInput("^+{t}")
#HotIf
