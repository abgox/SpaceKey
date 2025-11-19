; s(symbol): 符号
Space & s:: {
    /*
      ss: Ctrl + s
    */
    hit_key_double(() => Sleep(0), () => SendInput("^{s}"))
}

#HotIf GetKeyState("s", "p")

; 输出: ~
; 规律: t => tilde 波浪符
Space & t:: SendInput("+{``}")

; 输出: `
; 规律: b => back quote 反单引号
Space & b:: SendInput("{Text}``")

; 输出: !
; 规律: ! => gan 拼音(感叹号)
Space & g:: SendInput("{Text}!")

; 输出: @
; 规律: o 和 @ 长得像
Space & o:: SendInput("+{2}")

; 输出: #
; 规律: j => jing 拼音(井号)
Space & j:: SendInput("+{3}")

; 输出: $
; 规律: d => dollar 美元符号
Space & d:: SendInput("{Text}$")

; 输出: %
; 规律: p => percent 百分号
Space & p:: SendInput("+{5}")

; 输出: &
; 规律: h => he 拼音(和)
Space & h:: SendInput("+{7}")

; 输出: *
; 规律: * 像 , 旋转一圈的样子
Space & ,:: SendInput("+{8}")

; 输出: -
; 规律: m => middle 中横线
Space & m:: SendInput("{-}")

; 输出: _
; 规律: u => underline 下划线
Space & u:: SendInput("{Text}_")

; 输出: =
; 规律: e => equal 等于
Space & e:: SendInput("{=}")

; 输出: +
; 规律: a => add 加号
Space & a:: SendInput("+{=}")

; 输出: ^
; 规律: c => caret 脱字符
Space & c:: SendInput("{Text}^")

; 输出: ()
; 规律: k => kuo 拼音(括号)
Space & k:: SendInput("{Text}()"), SendInput("{Left}")

; 输出: {}
; 规律: l => large 大括号
Space & l:: SendInput("{Text}{}"), SendInput("{Left}")

; 输出: \
Space & /:: SendInput("{Text}\")

; 输出: |
; 规律: i 和 | 长得像
Space & i:: SendInput("+{\}")

#HotIf


; 输出: []
Space & [:: SendInput("{Text}[]"), SendInput("{Left}")

; 输出: <
Space & ,:: SendInput("{Text}<")

; 输出: >
Space & .:: SendInput("{Text}>")

; 输出: :
Space & `;:: SendInput("{Text}:")

; 输出: ""
Space & ':: SendInput('{Text}""'), SendInput("{Left}")

; 输出: ?
Space & /:: SendInput("{Text}?")
