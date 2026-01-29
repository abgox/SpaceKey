; 如果想要按住空格以输入连续空格，你需要先暂停 SpaceKey
; 你可以直接点击任务栏中的 SpaceKey 托盘图标来切换暂停/运行状态
$Space::Space

; 方向
Space & i:: SendInput("{Up}")
Space & k:: SendInput("{Down}")
Space & j:: SendInput("{Left}")
Space & l:: SendInput("{Right}")

Space & e:: SendInput("{Enter}") ; 回车
Space & b:: SendInput("{BackSpace}") ; 退格
Space & Tab:: SendInput("+{Tab}") ; Shift + Tab

; F1-F12
Space & 1:: SendInput("{F1}")
Space & 2:: SendInput("{F2}")
Space & 3:: SendInput("{F3}")
Space & 4:: SendInput("{F4}")
Space & 5:: SendInput("{F5}")
Space & 6:: SendInput("{F6}")
Space & 7:: SendInput("{F7}")
Space & 8:: SendInput("{F8}")
Space & 9:: SendInput("{F9}")
Space & 0:: SendInput("{F10}")
Space & -:: SendInput("{F11}")
Space & =:: SendInput("{F12}")
