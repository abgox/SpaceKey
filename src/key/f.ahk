; f(function): 功能按键
Space & f:: {
    hit_key_triple(
        () => "",
        () => (SendInput("^{f}")), ; 双击触发 Ctrl + f
        () => (SendInput("^{h}")) ; 三击触发 Ctrl + h
    )
}

#HotIf GetKeyState("f", "p")
Space & i::PgUp
Space & k::PgDn
Space & j::Home
Space & l::End

; f + e(find exe): 在 explorer(文件资源管理器) 中打开应用程序所在位置
Space & e:: Run("explorer.exe /select," '"' ProcessGetPath(WinGetPID("A")) '"')

; m(menu): 右键菜单
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
#HotIf
