#HotIf WinActive("ahk_exe Tabby.exe") && GetKeyState("w", "p")
Space & j:: SendInput("^+{tab}") ; 上一个 Tab
Space & l:: SendInput("^{tab}") ; 下一个 Tab
Space & c:: SendInput("^+{w}") ; 关闭当前 Tab
Space & n:: SendInput("^+{t}") ; 新建 Tab
#HotIf
