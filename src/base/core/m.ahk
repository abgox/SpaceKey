; m(modifier): 修饰键
Space & m:: return
Space & m Up:: {
    for key in ["Ctrl", "a", "s", "f", "g", "z", "x", "c", "v"]
        SendInput("{" key " Up}")
}

#HotIf GetKeyState("m", "p")

Space & a::^a
Space & s::^s
Space & f::^f
Space & g::^g
Space & z::^z
Space & x::^x
Space & c::^c
Space & v::^v

#HotIf
