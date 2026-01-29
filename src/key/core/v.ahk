; v(volume): 音量
; v(visual): 视觉相关
Space & v:: return

#HotIf GetKeyState("v", "p")

Space & i:: SendInput("{Volume_Up}")
Space & k:: SendInput("{Volume_Down}")
Space & m:: SendInput("{Volume_Mute}") ; m(mute) 静音

Space & j:: {
    v := change_screen_brightness(-10)
    if (v == -1) {
        v .= " (系统不支持)"
    }
    show_tip("当前屏幕亮度:   " v " ")
}
Space & l:: {
    v := change_screen_brightness(10)
    if (v == -1) {
        v .= " (系统不支持)"
    }
    show_tip("当前屏幕亮度:   " v " ")
}

Space & Left:: show_tip("当前窗口透明度:   " change_window_transparence(-1) " ")
Space & Right:: show_tip("当前窗口透明度:   " change_window_transparence(1) " ")

#HotIf
