; d(digit): 数字输入
Space & d:: return

#HotIf GetKeyState("d", "p")

Space & m:: SendInput("{1}")   ; 1
Space & ,:: SendInput("{2}")   ; 2
Space & .:: SendInput("{3}")   ; 3
Space & j:: SendInput("{4}")   ; 4
Space & k:: SendInput("{5}")   ; 5
Space & l:: SendInput("{6}")   ; 6
Space & u:: SendInput("{7}")   ; 7
Space & i:: SendInput("{8}")   ; 8
Space & o:: SendInput("{9}")   ; 9
Space & n:: SendInput("{0}")   ; 0  => n(null)
Space & p:: SendText(".")      ; .  => p(point/period)

#HotIf
