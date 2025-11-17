WinActiveVscode() {
    return WinActive("ahk_exe Code.exe")
        || WinActive("ahk_exe Trae.exe")
        || WinActive("ahk_exe Trae CN.exe")
}

vscode := {
    isSidebar: 0
}

; 聚焦在侧边栏
#HotIf vscode.isSidebar && WinActiveVscode()
clearVscodeSideTip() {
    vscode.isSidebar := 0
    if (vscode.sideTip_list) {
        for v in vscode.sideTip_list {
            v.Destroy()
        }
    }
    vscode.sideTip_list := []
}

; 聚焦到编辑区
<!l:: {
    SendInput("^{1}")
    clearVscodeSideTip()
}

; terminal
Space & t:: {
    hit_key_double(() => SendInput("^{``}"), () => SendInput("^+{``}"), 300)
    clearVscodeSideTip()
}

; 末尾添加 / 标识创建文件夹
; 它需要设置快捷键: 创建文件 (explorer.newFile : `Ctrl + Shift + Alt + =`  `Ctrl + Shift + Alt + a`)
Space & a:: {
    SendInput("^+!{=}")
    Sleep(100)
    SendInput("^+!{a}")
}

; 双击 d 删除文件/目录
Space & d:: {
    hit_key_double(
        () => Sleep(0),
        () => SendInput("{Delete}")
    )
}

#HotIf

; 聚焦在编辑区
#HotIf !vscode.isSidebar && WinActiveVscode() && GetKeyState("w", "p")
Space & j::^PgUp ; w + j --> 窗口向左切换
Space & l::^PgDn ; w + j --> 窗口向右切换
Space & c::^w    ; w + c --> 关闭当前编辑区窗口

#HotIf

; 聚焦在编辑区
#HotIf !vscode.isSidebar && WinActiveVscode()

; 聚焦到侧边栏
<!j:: {
    SendInput("^{0}")
    vscode.isSidebar := 1
    vscode.sideTip_list := editorSideTip("聚焦在侧边栏 - VS Code", , , , "ebc250")
}

; 显示/隐藏侧边栏
<!b::^b

; 跳转到指定行
Space & g::^g

; 运行当前文件
Space & r:: {
    ; 需要 Code Runner 插件
    ; 单击运行，双击终止
    hit_key_double(() => SendInput("^!{n}"), () => SendInput("^!{m}"), 300)
}

; terminal
Space & t:: {
    hit_key_double(() => SendInput("^{``}"), () => SendInput("^+{``}"), 300)
}

;  单击为行注释，双击为块注释
Space & c:: {
    hit_key_double(() => SendInput("^{/}"), () => SendInput("+!{a}"), 200)
}

; 向下插入行
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

; 以递归方式折叠/展开代码块 (当前层级)
<!f:: {
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
