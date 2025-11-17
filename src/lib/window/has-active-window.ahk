/**
 * 检测是否有激活窗口
 * @param {string} title 指定窗口
 * @returns {0 | 1}
 * @example has_active_window("A")
 * @example has_active_window("ahk_exe Code.exe")
 */
has_active_window(title := "A") {
    try {
        WinGetTitle(title)
        if (WinGetTitle(title) = "") {
            return 0
        }
    } catch {
        return 0
    }
    return 1
}
