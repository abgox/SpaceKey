#Include has-active-window.ahk

/**
 * 改变窗口透明度，每次改变 10
 * @param {1 | -1} flag 1/-1 增加/减少
 * @param {string} title 窗口标题，默认当前激活窗口
 */
window_transparence_change(flag, title := "A") {
    if !has_active_window(title) {
        return
    }
    transparent := WinGetTransparent(title) ? WinGetTransparent(title) : 255
    if (flag = 1) {
        if (transparent > 5) {
            transparent := (transparent - 10)
            WinSetTransparent(transparent, title)
        } else {
            transparent := 1    ; 如果为0，则这时，捕捉不到窗口，透明度会因为三元运算符设定为255，周而复始循环
            WinSetTransparent(1, title)
        }
    } else {
        if (transparent < 245) {
            transparent := (transparent + 10)
            WinSetTransparent(transparent, title)
        } else {
            transparent := 255
            WinSetTransparent("Off", title)
        }
    }
    return 255 - transparent
}
