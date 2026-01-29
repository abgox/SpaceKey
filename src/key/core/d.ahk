; d(digit): 数字输入
Space & d:: return

#HotIf GetKeyState("d", "p")

Space & m:: SendInput("{Numpad1}")   ; 1
Space & ,:: SendInput("{Numpad2}")   ; 2
Space & .:: SendInput("{Numpad3}")   ; 3
Space & j:: SendInput("{Numpad4}")   ; 4
Space & k:: SendInput("{Numpad5}")   ; 5
Space & l:: SendInput("{Numpad6}")   ; 6
Space & u:: SendInput("{Numpad7}")   ; 7
Space & i:: SendInput("{Numpad8}")   ; 8
Space & o:: SendInput("{Numpad9}")   ; 9
Space & n:: SendInput("{Numpad0}")   ; 0  => n(null)
Space & p:: SendInput("{NumpadDot}") ; .  => p(point/period)

#HotIf
