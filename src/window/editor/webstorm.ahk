/*
使用 VS Code 按键映射
    需要移除 `按键映射` 中的 `扩展行选区` 的快捷键，或将其从 Ctrl + i 修改为 Ctrl + Shift + i (或其他)
    如果不移除它，Ctrl + i 无法触发代码补全
需要添加快捷键
    `按键映射` -> `主菜单` -> `文件` -> `文件打开操作` -> `新建` -> `文件` : `Ctrl + Shift + Alt + =`  `Ctrl + Shift + Alt + a`
    `按键映射` -> `主菜单` -> `文件` -> `文件打开操作` -> `新建` -> `创建新目录或软件包`: `Ctrl + Shift + Alt + =`  `Ctrl + Shift + Alt + m`
*/

win_active_webstorm() {
    return WinActive("ahk_exe webstorm64.exe")
}

clear_webstorm_side_tip() {
    webstorm.isSidebar := 0
    if (webstorm.sideTip_list) {
        for v in webstorm.sideTip_list {
            v.Destroy()
        }
    }
    webstorm.sideTip_list := []
}

webstorm := {
    isSidebar: 0
}

; 聚焦在侧边栏
#HotIf webstorm.isSidebar && win_active_webstorm()

; 聚焦到编辑区
; 按键: LAlt + l
<!l:: {
    SendInput("{Esc}")
    clear_webstorm_side_tip()
}

; t(terminal): 终端
Space & t:: {
    hit_key_double(
        () => SendInput("^{``}"), ; 单击打开终端
        () => SendInput("^+{``}"), ; 双击新建终端
    )
    clear_webstorm_side_tip()
}

; a(append): 创建文件(需设置快捷键)
Space & a:: {
    SendInput("^+!{=}")
    Sleep(100)
    SendInput("^+!{a}")
}

; m(mkdir): 创建目录(需设置快捷键)
Space & m:: {
    if (!GetKeyState("f", "P")) {
        SendInput("^+!{=}")
        Sleep(100)
        SendInput("^+!{m}")
    }
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
#HotIf !webstorm.isSidebar && win_active_webstorm() && GetKeyState("w", "p")

; 上一个标签页窗口
Space & j::^PgUp

; 下一个标签页窗口
Space & l::^PgDn

; c(close): 关闭当前标签页窗口
Space & c::^w

#HotIf

; 聚焦在编辑区
#HotIf !webstorm.isSidebar && win_active_webstorm()

; 聚焦到侧边栏
; 按键: LAlt + j
<!j:: {
    SendInput("^+{e}")
    webstorm.isSidebar := 1
    webstorm.sideTip_list := show_tip("【" WinGetProcessName("A") "】" "聚焦在侧边栏", 0, , , , "ebc250")
}

; 显示/隐藏侧边栏
<!b::^+e

; g(go): 跳转到指定行
Space & g::^g

; r(run): 运行当前文件
Space & r:: {
    hit_key_double(
        () => SendInput("^{F5}"), ; 单击触发运行
        () => SendInput("+{F5}"), ; 双击触发终止运行
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

; 向下插入一行
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

; 以递归方式折叠/展开 (当前层级)
; 按键: LAlt + f
<!f:: {
    hit_key_double(
        () => SendInput("^+{[}"), ; 单击触发折叠
        () => SendInput("^+{]}"), ; 双击触发展开
    )
}

#HotIf
