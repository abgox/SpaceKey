; f(function): 功能按键
Space & f:: return

#HotIf GetKeyState("f", "p")
Space & i::PgUp
Space & k::PgDn
Space & j::Home
Space & l::End

Space & e::Esc
Space & d::Delete

; m(menu): 右键菜单
; 第一次触发: 打开右键菜单
; 第二次触发: 退出右键菜单
Space & m:: {
    static flag := 0
    if (flag) {
        ; 退出右键菜单
        SendInput("{Esc}")
        flag := 0
    } else {
        ; 触发右键菜单
        SendInput("{AppsKey}")
        flag := 1
    }
}

; w(window): 窗口置顶 / 取消置顶
Space & w:: {
    if !has_active_window()
        return
    title := WinGetTitle("A")
    WinSetAlwaysOnTop(-1, "A")
    prefix := WinGetExStyle("A") & 0x8 ? "【置顶】" : "【取消置顶】"
    show_tip(prefix title, , 20)
}
#HotIf
