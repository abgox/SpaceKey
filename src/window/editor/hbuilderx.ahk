; # 使用 HBuilderX 按键映射
; # 不修改按键映射

hbuilder := {
    isSidebar: 0
}

; 聚焦在侧边栏
#HotIf hbuilder.isSidebar && WinActive("ahk_exe HBuilderX.exe")
clearHBuilderXSideTip() {
    hbuilder.isSidebar := 0
    if (hbuilder.sideTip_list) {
        for v in hbuilder.sideTip_list {
            v.Destroy()
        }
    }
    hbuilder.sideTip_list := []
}

; 聚焦到编辑区
<!l:: {
    SendInput("!{n}")
    clearHBuilderXSideTip()
}

Space & t:: {  ; terminal
    SendInput("!{c}")
    clearHBuilderXSideTip()
}

; 创建文件
Space & a:: {
    SendInput("^{n}")
    Sleep(100)
    SendInput("0")
}
; 创建目录
Space & m:: {
    if (!GetKeyState("f", "P")) {
        SendInput("^{n}")
        Sleep(100)
        SendInput("2")
    }
}
; 双击 d 删除文件/目录
Space & d:: {
    hit_key_double(
        () => Sleep(0),
        () => (
            SendInput("{AppsKey}"),
            Sleep(100),
            SendInput("d")
        )
    )
}

#HotIf

; 聚焦在编辑区
#HotIf !hbuilder.isSidebar && WinActive("ahk_exe HBuilderX.exe") && GetKeyState("w", "p")
Space & j::^PgUp ; w + j --> 窗口向左切换
Space & l::^PgDn ; w + j --> 窗口向右切换
Space & c::^w    ; w + c --> 关闭当前编辑区窗口
#HotIf

; 聚焦在编辑区
#HotIf !hbuilder.isSidebar && WinActive("ahk_exe HBuilderX.exe")

; 聚焦到侧边栏
<!j:: {
    SendInput("!+{q}")
    hbuilder.isSidebar := 1
    hbuilder.sideTip_list := editorSideTip("聚焦在侧边栏 - HBuilderX", , , , "ebc250")
}

; 显示/隐藏侧边栏
<!b::!q

; 跳转到指定行
Space & g::^g

; terminal
Space & t::!c

;  单击为行注释，双击为块注释
Space & c:: {
    hit_key_double(() => SendInput("^{/}"), () => SendInput("^+{/}"), 200)
}

/*
    向下插入一行
    这会直接让 Space + Shift + Enter  变成向上插入一行
*/
Space & Enter::^Enter

; 上下移动选中行
<!i::^Up
<!k::^Down

;多行光标，也可以使用 Ctrl + Alt + Up/Down 触发
<^#i::^!Up
<^#k::^!Down

; 以递归方式折叠/展开 (当前层级)
<!f:: {
    hit_key_double(() => SendInput("!+{-}"), () => SendInput("!+{=}"), 300)
}

#HotIf
