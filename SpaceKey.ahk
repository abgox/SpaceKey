;@AHK2Exe-SetName SpaceKey
;@Ahk2Exe-SetOrigFilename SpaceKey.ahk
;@Ahk2Exe-SetVersion 1.0.0
;@Ahk2Exe-SetCopyright Copyright (c) 2024-present abgox
;@Ahk2Exe-UpdateManifest 1
#SingleInstance Force

#Include utils.ahk

$Space::Space

; 脚本启停
; 如果需要连续空格，先停用脚本输入连续空格，再启用脚本
#SuspendExempt
#Esc:: Suspend
#SuspendExempt False

Space & i::Up
Space & k::Down
Space & j::Left
Space & l::Right

Space & e::Enter
Space & b::BackSpace ; b => Backspace
Space & Tab:: SendInput("+{Tab}")
Space & q::Esc ; q => quit

#up:: { ; 窗口置顶 / 取消置顶
    if !hasActiveWindow("检测窗口失败，无法置顶")
        return
    w := WinGetid("A")
    oTitle := WinGetTitle("ahk_id " w)
    WinSetAlwaysOnTop(-1, "ahk_id " w)
    ExStyle := WinGetExStyle("ahk_id " w)
    ((ExStyle & 0x8) ? oTop := "置顶" : oTop := "取消置顶")
    showTip(oTop " --- " oTitle, , 20)
}

; 空格 + 数字 => F1-F12
Space & 1::F1
Space & 2::F2
Space & 3::F3
Space & 4::F4
Space & 5::F5
Space & 6::F6
Space & 7::F7
Space & 8::F8
Space & 9::F9
Space & 0::F10
Space & -::F11
Space & =::F12

Space & f:: return
#HotIf GetKeyState("f", "p")
Space & i::PgUp
Space & k::PgDn
Space & j::Home
Space & l::End
Space & e:: { ;在文件管理器中定位应用程序 (find exe)
    path := ProcessGetPath(WinGetPID("A"))
    Run("explorer.exe /select," '"' path '"')
    showTip("打开目录 >>>  " path, 5000)
}
#HotIf

; 符号输入
Space & s:: return
#HotIf GetKeyState("s", "p")
Space & n:: SendInput("+{8}")     ; n => *
Space & i:: SendInput("+{\}")     ; i => | (长的像)
Space & e:: SendInput("{=}")      ; e => = (equal)
Space & t:: SendInput("+{``}")    ; t => ~ (tilde　波浪符)
Space & o:: SendInput("+{2}")     ; o => @ (长的像)
Space & p:: SendInput("+{5}")     ; p => % (百分号 Percent)
Space & a:: SendInput("+{=}")     ; a => + (add)
Space & m:: SendInput("{-}")      ; m => - (middle)
Space & h:: SendInput("+{7}")     ; h => & (拼音 he)
Space & j:: SendInput("+{3}")     ; j => # (拼音 jin)

Space & g:: SendInput("{Text}!")  ; g => ! (拼音 感叹号 g)
Space & u:: SendInput("{Text}_")  ; u => _ (underline)
Space & d:: SendInput("{Text}$")  ; d => $ (dollar)
Space & c:: SendInput("{Text}^")  ; c => ^ (caret 脱字符)
Space & b:: SendInput("{Text}``") ; b => `` (Back quote 反单引号)

Space & k:: SendInput("{Text}(")
Space & l:: SendInput("{Text})")

Space & /:: SendInput("{Text}\")    ; => \

; 成对符号
Space & [:: SendInput("{Text}{}"), SendInput("{Left}")
Space & ]:: SendInput("{Text}}")

Space & ,:: SendInput("{Text}《》"), SendInput("{Left}")
Space & .:: SendInput("{Text}>") ; => >

#HotIf

Space & [:: SendInput("{Text}[]"), SendInput("{Left}")
Space & ]:: SendInput("{Text}]")

Space & ,:: SendInput("{Text}<") ; => <
Space & .:: SendInput("{Text}>") ; => >
Space & `;:: SendInput("{Text}:") ; => :
Space & ':: SendInput("+{'}")  ; => ""
Space & \:: SendInput("+{\}")  ; => |
Space & /:: SendInput("+{/}")  ; => ?

; 数字输入
Space & d:: return
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
#HotIf

; 音量(volume),亮度(visual)控制
Space & v:: Sleep(0)
#HotIf GetKeyState("v", "p")
Space & i:: SendInput("{Volume_Up}")
Space & k:: SendInput("{Volume_Down}")
Space & m:: SendInput("{Volume_Mute}")    ;  mute
Space & j:: showTip("当前亮度:   " changeBrightness(-10) " ")
Space & l:: showTip("当前亮度:   " changeBrightness(10) " ")
Space & Up:: showTip("当前窗口透明度:   " changeTransparence(1) " ")
Space & Down:: showTip("当前窗口透明度:   " changeTransparence(-1) " ")
#HotIf
