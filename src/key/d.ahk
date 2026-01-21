; d(digit): 数字输入
Space & d:: return

#HotIf GetKeyState("d", "p")
Space & m::1
Space & ,::2
Space & .::3
Space & j::4
Space & k::5
Space & l::6
Space & u::7
Space & i::8
Space & o::9
Space & n::0 ; n(null)
Space & p:: SendText(".") ; p(period/point)
#HotIf
