; w(window): 窗口相关
Space & w:: {
    Sleep(0)
}

#HotIf GetKeyState("w", "p")

; 窗口置顶 / 取消置顶
Space & up:: {
    if !has_active_window()
        return
    title := WinGetTitle("A")
    WinSetAlwaysOnTop(-1, "A")
    prefix := WinGetExStyle("A") & 0x8 ? "【置顶】" : "【取消置顶】"
    show_tip(prefix title, , 20)
}

; 窗口大小切换
Space & Enter:: {
    if !has_active_window()
        return
    if (WinGetMinMax("A")) {
        ; 1 或 -1 时，恢复窗口大小
        WinRestore("A")
    } else {
        WinMaximize("A")
    }
}

#HotIf
