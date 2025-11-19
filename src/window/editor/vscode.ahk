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
    /*
      t: 打开终端
      tt: 新建终端
    */
    hit_key_double(() => SendInput("^{``}"), () => SendInput("^+{``}"), 300)
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
    /*
      dd: 触发 Delete
    */
    hit_key_double(() => Sleep(0), () => SendInput("{Delete}"))
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
    /*
      r: 运行
      rr: 终止运行
    */
    hit_key_double(() => SendInput("^!{n}"), () => SendInput("^!{m}"), 300)
}

; t(terminal): 终端
Space & t:: {
    /*
      t: 打开终端
      tt: 新建终端
    */
    hit_key_double(() => SendInput("^{``}"), () => SendInput("^+{``}"), 300)
}

; c(comment): 注释
Space & c:: {
    /*
      c: 行注释
      cc: 块注释
    */
    hit_key_double(() => SendInput("^{/}"), () => SendInput("+!{a}"), 200)
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
    /*
      f: 折叠
      ff: 展开
    */
    hit_key_double(
        () => (
            SendInput("^{k}"),
            Sleep(100),
            SendInput("^{[}")
        ),
        () => (
            SendInput("^{k}"),
            Sleep(100),
            SendInput("^{]}")
        ),
        300
    )
}

#HotIf
