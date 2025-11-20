/*
需要添加快捷键
   创建文件 (explorer.newFile : `Ctrl + Shift + Alt + =`  `Ctrl + Shift + Alt + a`)
   创建目录 (explorer.newFolder : `Ctrl + Shift + Alt + =`  `Ctrl + Shift + Alt + m`)
*/

win_active_vscode() {
    return WinActive("ahk_exe Code.exe")
        || WinActive("ahk_exe VSCodium.exe")
        || WinActive("ahk_exe Trae.exe")
        || WinActive("ahk_exe Trae CN.exe")
        || WinActive("ahk_exe Qoder.exe")
        || WinActive("ahk_exe CodeBuddy.exe")
        || WinActive("ahk_exe Windsurf.exe")
}

clear_vscode_side_tip() {
    vscode.isSidebar := 0
    if (vscode.sideTip_list) {
        for v in vscode.sideTip_list {
            v.Destroy()
        }
    }
    vscode.sideTip_list := []
}

vscode := {
    isSidebar: 0
}

; 聚焦在侧边栏
#HotIf vscode.isSidebar && win_active_vscode()

; 聚焦到编辑区
; 按键: LAlt + l
<!l:: {
    SendInput("^{1}")
    clear_vscode_side_tip()
}

; t(terminal): 终端
Space & t:: {
    hit_key_double(
        () => SendInput("^{``}"), ; 单击打开终端
        () => SendInput("^+{``}"), ; 双击新建终端
    )
    clear_vscode_side_tip()
}

; a(append): 创建文件(需设置快捷键)
; 末尾添加 / 也能创建目录
Space & a:: {
    SendInput("^+!{=}")
    Sleep(100)
    SendInput("^+!{a}")
}

; m(mkdir): 创建目录(需设置快捷键)
Space & m:: {
    SendInput("^+!{=}")
    Sleep(100)
    SendInput("^+!{m}")
}

; d(delete): 删除文件/目录
Space & d:: {
    hit_key_double(
        () => Sleep(0),
        () => SendInput("{Delete}") ; 双击触发 Delete
    )
}

#HotIf

; 聚焦在编辑区
#HotIf !vscode.isSidebar && win_active_vscode() && GetKeyState("w", "p")

; 上一个标签页窗口
Space & j::^PgUp

; 下一个标签页窗口
Space & l::^PgDn

; c(close): 关闭当前标签页窗口
Space & c::^w

#HotIf

; 聚焦在编辑区
#HotIf !vscode.isSidebar && win_active_vscode()

; 聚焦到侧边栏
; 按键: LAlt + j
<!j:: {
    SendInput("^{0}")
    vscode.isSidebar := 1
    vscode.sideTip_list := show_tip("【" WinGetProcessName("A") "】" "聚焦在侧边栏", 0, , , , "ebc250")
}

; 显示/隐藏侧边栏
; 按键: LAlt + b
<!b::^b

; g(go): 跳转到指定行
Space & g::^g

; r(run): 运行当前文件(需要 Code Runner 插件)
Space & r:: {
    hit_key_double(
        () => SendInput("^!{n}"), ; 单击触发运行
        () => SendInput("^!{m}"), ; 双击触发终止运行
    )
}

; t(terminal): 终端
Space & t:: {
    hit_key_double(
        () => SendInput("^{``}"), ; 单击打开终端
        () => SendInput("^+{``}"), ; 双击新建终端
    )
}

; c(comment): 注释
Space & c:: {
    hit_key_double(
        () => SendInput("^{/}"), ; 单击触发行注释
        () => SendInput("+!{a}"), ; 双击触发块注释
    )
}

; 向下插入行
Space & Enter::^Enter

/*
上下移动选中行
按键:
    LAlt + i
    LAlt + k
*/
<!i::!Up
<!k::!Down

/*
上下复制选中行
按键:
    LAlt + Shift + i
    LAlt + Shift + k
*/
<!+i::+!Up
<!+k::+!Down

/*
多行光标
按键:
    LCtrl + Win + i
    LCtrl + Win + k
*/
<^#i::^!Up
<^#k::^!Down

; 以递归方式折叠/展开代码块 (当前层级)
; 按键: LAlt + f
<!f:: {
    hit_key_double(
        () => (
            ; 单击触发折叠
            SendInput("^{k}"),
            Sleep(100),
            SendInput("^{[}")
        ),
        () => (
            ; 双击触发展开
            SendInput("^{k}"),
            Sleep(100),
            SendInput("^{]}")
        ),
    )
}

#HotIf
