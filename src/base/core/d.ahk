; d(digit): 数字输入
Space & d:: return
Space & d Up:: {
    for key in ["Numpad1", "Numpad2", "Numpad3", "Numpad4", "Numpad5", "Numpad6", "Numpad7", "Numpad8", "Numpad9", "Numpad0", "NumpadDot"]
        SendInput("{" key " Up}")
}

#HotIf GetKeyState("d", "p")

Space & m::Numpad1   ; 1
Space & ,::Numpad2   ; 2
Space & .::Numpad3   ; 3
Space & j::Numpad4   ; 4
Space & k::Numpad5   ; 5
Space & l::Numpad6   ; 6
Space & u::Numpad7   ; 7
Space & i::Numpad8   ; 8
Space & o::Numpad9   ; 9
Space & n::Numpad0   ; 0  => n(null)
Space & p::NumpadDot ; .  => p(point/period)

#HotIf
