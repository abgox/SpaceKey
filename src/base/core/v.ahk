; v(volume): 音量
; v(visual): 视觉相关
Space & v:: return
; Space & v Up:: {
;     for key in [
;         "Volume_Up", "Volume_Down", "Volume_Mute" ; 抬起事件也会触发相关功能
;     ]
;         SendInput("{" key " Up}")
; }

#HotIf GetKeyState("v", "p")

Space & i::Volume_Up
Space & k::Volume_Down
Space & m::Volume_Mute ; m(mute) 静音

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
