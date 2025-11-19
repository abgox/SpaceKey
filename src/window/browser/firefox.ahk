#HotIf WinActive("ahk_exe firefox.exe") && GetKeyState("w", "p")
; 切换到上一个标签页
Space & j::^+Tab

; 切换到下一个标签页
Space & l::^Tab

; n(new): 新建标签页
Space & n::^t

; c(close): 关闭当前标签页
Space & c::^w

; r(restore): 恢复窗口
Space & r::^+t

; f(focus): 聚焦搜索栏
Space & f::^l

#HotIf
