; v(volume): 音量
; v(visual): 视觉相关
Space & v:: {
    Sleep(0)
}

#HotIf GetKeyState("v", "p")
Space & i:: SendInput("{Volume_Up}")
Space & k:: SendInput("{Volume_Down}")
Space & m:: SendInput("{Volume_Mute}") ; m(mute) 静音
Space & j:: show_tip("当前屏幕亮度:   " change_screen_brightness(-10) " ")
Space & l:: show_tip("当前屏幕亮度:   " change_screen_brightness(10) " ")
Space & Up:: show_tip("当前窗口透明度:   " change_window_transparence(1) " ")
Space & Down:: show_tip("当前窗口透明度:   " change_window_transparence(-1) " ")
#HotIf
