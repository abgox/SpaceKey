; r(range): 范围/步长放大
Space & r:: return
Space & r Up:: {
    for key in ["Ctrl", "Left", "Right", "BackSpace", "Delete"]
        SendInput("{" key " Up}")
}

#HotIf GetKeyState("r", "p")

Space & j::^Left       ; j(left): 向左跳跃一个单词
Space & l::^Right      ; l(right): 向右跳跃一个单词

Space & b::^BackSpace  ; b(before/backward): 向前/向左删除上一个单词
Space & n::^Delete     ; n(next): 向后删除下一个单词

#HotIf
