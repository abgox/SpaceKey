; s(symbol): 符号
Space & s:: {
  hit_key_double(
    () => "",
    () => (SendInput("^{s}")) ; 双击触发 Ctrl + s
  )
}

#HotIf GetKeyState("s", "p")

; 输出: ~
; 规律: t => tilde 波浪符
Space & t:: SendInput("+{``}")

; 输出: `
; 规律: b => backtick 反单引号
Space & b:: SendText("``")

; 输出: !
; 规律: g => gǎn 拼音(感叹号)
Space & g:: SendText("!")

; 输出: @
; 规律: o 和 @ 长得像
Space & o:: SendInput("+{2}")

; 输出: #
; 规律: j => jǐng 拼音(井号)
Space & j:: SendInput("+{3}")

; 输出: $
; 规律: d => dollar 美元符号
Space & d:: SendText("$")

; 输出: %
; 规律: p => percent 百分号
Space & p:: SendInput("+{5}")

; 输出: &
; 规律: h => hé 拼音(和)
Space & h:: SendInput("+{7}")

; 输出: *
; 规律: n => night 晚上有星星(*)
Space & n:: SendInput("+{8}")

; 输出: -
; 规律: m => middle 中横线
Space & m:: SendInput("{-}")

; 输出: _
; 规律: u => underline 下划线
Space & u:: SendText("_")

; 输出: =
; 规律: e => equal 等于
Space & e:: SendInput("{=}")

; 输出: +
; 规律: a => add 加号
Space & a:: SendInput("+{=}")

; 输出: ^
; 规律: c => caret 脱字符
Space & c:: SendText("^")

; 输出: ()
; 规律: k => kuò 拼音(括号)
Space & k:: SendText("()"), SendInput("{Left}")

; 输出: {}
; 规律: l => large 大括号
Space & l:: SendText("{}"), SendInput("{Left}")

; 输出: \
; 规律: 方向相反
Space & /:: SendText("\")

; 输出: |
; 规律: i 和 | 长得像
Space & i:: SendInput("+{\}")

#HotIf


; 输出: []
Space & [:: SendText("[]"), SendInput("{Left}")

; 输出: <
Space & ,:: SendText("<")

; 输出: >
Space & .:: SendText(">")

; 输出: :
Space & `;:: SendText(":")

; 输出: ""
Space & ':: SendText('""'), SendInput("{Left}")

; 输出: ?
Space & /:: SendText("?")
