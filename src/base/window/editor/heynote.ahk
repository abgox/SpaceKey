#HotIf WinActive("ahk_exe Heynote.exe") && GetKeyState("w", "p")
Space & j:: SendInput("^+{Tab}") ; 上一个标签页
Space & l:: SendInput("^{Tab}") ; 下一个标签页
Space & i:: SendInput("^{Home}") ; 页面的开头
Space & k:: SendInput("^{End}") ; 页面的结尾
#HotIf
