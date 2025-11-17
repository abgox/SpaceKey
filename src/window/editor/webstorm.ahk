/*
# 使用 VS Code 按键映射
# 移除 `按键映射` 中的 `扩展行选区` 的快捷键，或将其从 Ctrl + i 修改为 Ctrl + Shift + i (或其他)
?   -  如果不移除它，Ctrl + i 无法触发代码补全
# 添加快捷键
?   -  `按键映射` -> `主菜单` -> `文件` -> `文件打开操作` -> `新建` -> `文件` : `Ctrl + Shift + Alt + =`  `Ctrl + Shift + Alt + a`
?   -  `按键映射` -> `主菜单` -> `文件` -> `文件打开操作` -> `新建` -> `创建新目录或软件包`: `Ctrl + Shift + Alt + =`  `Ctrl + Shift + Alt + m`
*/

activeWebstorm() {
    return WinActive("ahk_exe webstorm64.exe")
        || WinActive("ahk_exe java.exe")
}


webstorm := {
    isSidebar: 0
}


; 聚焦在侧边栏
#HotIf webstorm.isSidebar && activeWebstorm()
clearWebstormSideTip() {
    webstorm.isSidebar := 0
    if (webstorm.sideTip_list) {
        for v in webstorm.sideTip_list {
            v.Destroy()
        }
    }
    webstorm.sideTip_list := []
}

; 聚焦到编辑区
<!l:: {
    SendInput("{Esc}")
    clearWebstormSideTip()
}

; terminal
Space & t:: {
    hit_key_double(() => SendInput("^{``}"), () => SendInput("^+{``}"), 300)
}

; ? 需设置快捷键
Space & a:: {
    SendInput("^+!{=}")
    Sleep(100)
    SendInput("^+!{a}")
}

; ? 需设置快捷键
Space & m:: {
    if (!GetKeyState("f", "P")) {
        SendInput("^+!{=}")
        Sleep(100)
        SendInput("^+!{m}")
    }
}

#HotIf

; 聚焦在编辑区
#HotIf !webstorm.isSidebar && activeWebstorm() && GetKeyState("w", "p")
Space & j::^PgUp ; w + j --> 窗口向左切换
Space & l::^PgDn ; w + j --> 窗口向右切换
Space & c::^w    ; w + c --> 关闭当前编辑区窗口
#HotIf

; 聚焦在编辑区
#HotIf !webstorm.isSidebar && activeWebstorm()

; 聚焦到侧边栏
<!j:: {
    SendInput("^+{e}")
    webstorm.isSidebar := 1
    webstorm.sideTip_list := editorSideTip("聚焦在侧边栏 - WebStorm", , , , "ebc250")
}

; 显示/隐藏侧边栏
<!b::^+e

; 跳转到指定行
Space & g::^g

; 运行当前文件
Space & r:: {
    ; 需要 Code Runner 插件
    hit_key_double(do, do2, 300)
    do() {
        ; 运行当前文件
        SendInput("^{F5}")
    }
    do2() {
        ; 停止运行
        SendInput("+{F5}")
    }
}

Space & t:: {  ; terminal
    hit_key_double(do, do2, 300)
    do() {
        SendInput("^{``}")
    }
    do2() {
        SendInput("^+{``}")
    }
}

;  单击为行注释，双击为块注释
Space & c:: {
    hit_key_double(do, do2, 200)
    do() {
        SendInput("^{/}")
    }
    do2() {
        SendInput("+!{a}")
    }
}

; 向下插入一行
Space & Enter::^Enter

; 上下移动选中行
<!i::!Up
<!k::!Down

; 上下复制选中行
<!+i::+!Up
<!+k::+!Down

;多行光标，也可以使用 Ctrl + Alt + Up/Down 触发
<^#i::^!Up
<^#k::^!Down

; 以递归方式折叠/展开 (当前层级)
<!f:: {
    hit_key_double(() => SendInput("^+{[}"), () => SendInput("^+{]}"), 300)
}

#HotIf
