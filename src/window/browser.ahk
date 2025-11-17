/**
 * 浏览器窗口是否处于激活状态
 * @returns {Boolean}
 */
WinActiveBrowser() {
    return WinActive("ahk_exe msedge.exe")
        || Winactive("ahk_exe chrome.exe")
        || WinActive("ahk_exe firefox.exe")
        || WinActive("ahk_exe zen.exe")
        || WinActive("ahk_exe brave.exe")
}

#HotIf WinActiveBrowser() && GetKeyState("w", "p")
; 切换到下一个标签页
Space & j::^+Tab

; 切换到上一个标签页
Space & l::^Tab

; 新建标签页
Space & n::^t

; 关闭当前标签页
Space & c::^w

; 搜索标签页
Space & s::^+a

; 恢复窗口 restore
Space & r::^+t

;
Space & f::^l

; 打开书签/收藏夹
Space & b::^+o

; 打开下载
Space & d::^j

; 打开历史记录
Space & h::^h

; 打开文件
Space & o::^o

#HotIf
