; # 使用 HBuilderX 按键映射
; # 不修改按键映射

clear_hbuilderx_side_tip() {
    hbuilder.isSidebar := 0
    if (hbuilder.sideTip_list) {
        for v in hbuilder.sideTip_list {
            v.Destroy()
        }
    }
    hbuilder.sideTip_list := []
}

hbuilder := {
    isSidebar: 0
}

; 聚焦在侧边栏
#HotIf hbuilder.isSidebar && WinActive("ahk_exe HBuilderX.exe")

; 聚焦到编辑区
; 按键: LAlt + l
<!l:: {
    SendInput("!{n}")
    clear_hbuilderx_side_tip()
}

; t(terminal): 终端
Space & t:: {
    SendInput("!{c}")
    clear_hbuilderx_side_tip()
}

; a(append): 创建文件
Space & a:: {
    SendInput("^{n}")
    Sleep(100)
    SendInput("0")
}

; m(mkdir): 创建目录
Space & m:: {
    if (!GetKeyState("f", "P")) {
        SendInput("^{n}")
        Sleep(100)
        SendInput("2")
    }
}

; d(delete): 删除文件/目录
Space & d:: {
    hit_key_double(
        () => "",
        () => (
            ; 双击触发删除
            SendInput("{AppsKey}"),
            Sleep(100),
            SendInput("d")
        )
    )
}

#HotIf

; 聚焦在编辑区
#HotIf !hbuilder.isSidebar && WinActive("ahk_exe HBuilderX.exe") && GetKeyState("w", "p")

; 上一个标签页窗口
Space & j::^PgUp

; 下一个标签页窗口
Space & l::^PgDn

; c(close): 关闭当前标签页窗口
Space & c::^w

#HotIf

; 聚焦在编辑区
#HotIf !hbuilder.isSidebar && WinActive("ahk_exe HBuilderX.exe")

; 聚焦到侧边栏
; 按键: LAlt + j
<!j:: {
    SendInput("!+{q}")
    hbuilder.isSidebar := 1
    hbuilder.sideTip_list := show_tip("【" WinGetProcessName("A") "】" "聚焦在侧边栏", 0, , , , "ebc250")
}

; 显示/隐藏侧边栏
; 按键: LAlt + b
<!b::!q

; g(go): 跳转到指定行
Space & g::^g

; t(terminal): 终端
Space & t::!c

; c(comment): 注释
Space & c:: {
    hit_key_double(
        () => (SendInput("^{/}")), ; 单击触发行注释
        () => (SendInput("^+{/}")), ; 双击触发块注释
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
<!i::^Up
<!k::^Down

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
        () => (SendInput("!+{-}")), ; 单击触发折叠
        () => (SendInput("!+{=}")), ; 双击触发展开
    )
}

#HotIf
