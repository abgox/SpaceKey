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
Space & m::AppsKey

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
