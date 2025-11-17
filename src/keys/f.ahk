; f(function): 功能按键
Space & f:: {
    ; ff: Ctrl + f
    ; fff: Ctrl + h
    hit_key_triple(() => Sleep(0), () => SendInput("^{f}"), () => SendInput("^{h}"))
}

#HotIf GetKeyState("f", "p")
Space & i::PgUp
Space & k::PgDn
Space & j::Home
Space & l::End

; 在文件管理器中定位应用程序， f + e = find exe
Space & e:: {
    path := ProcessGetPath(WinGetPID("A"))
    Run("explorer.exe /select," '"' path '"')
}

; m(menu): 右键菜单
Space & m:: {
    static flag := 0
    if (flag) {
        SendInput("{Esc}")
        flag := 0
    } else {
        SendInput("{AppsKey}")
        flag := 1
    }
}
#HotIf
