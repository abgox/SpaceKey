; v(volume): 音量
; v(visual): 视觉相关
Space & v:: {
    Sleep(0)
}

#HotIf GetKeyState("v", "p")
Space & i:: SendInput("{Volume_Up}")
Space & k:: SendInput("{Volume_Down}")
Space & m:: SendInput("{Volume_Mute}") ; mute
Space & j:: Tip("当前亮度:   " change_brightness(-10) " ")
Space & l:: Tip("当前亮度:   " change_brightness(10) " ")
Space & Up:: Tip("当前窗口透明度:   " window_transparence_change(1) " ")
Space & Down:: Tip("当前窗口透明度:   " window_transparence_change(-1) " ")
#HotIf
