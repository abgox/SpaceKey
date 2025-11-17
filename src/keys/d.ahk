; d(digit): 数字输入
Space & d:: {
    ; dd: Delete
    hit_key_double(() => Sleep(0), () => SendInput("{Delete}"))
}

#HotIf GetKeyState("d", "p")
Space & u::7
Space & i::8
Space & o::9
Space & j::4
Space & k::5
Space & l::6
Space & m::1
Space & ,::2
Space & .::3
Space & n::0
Space & h:: SendInput("{Text}.")
#HotIf
