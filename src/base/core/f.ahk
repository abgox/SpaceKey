; f(function): 功能按键
Space & f:: return
Space & f Up:: {
    for key in [
        "PgUp", "PgDn", "Home", "End", "Esc",
        ; "AppsKey" ; 抬起事件也会触发相关功能
    ]
        SendInput("{" key " Up}")
}

#HotIf GetKeyState("f", "p")

Space & i::PgUp
Space & k::PgDn
Space & j::Home
Space & l::End

Space & e::Esc
Space & m::AppsKey ; m(menu): 右键菜单

#HotIf
