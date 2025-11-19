/**
 * - 创建一个文本提示
 * - 默认位置为屏幕底部以上 200 像素居中
 * - 如果存在多块屏幕，会在每块屏幕上创建一个提示
 * @param {String} Text  显示文本
 * @param {number} Delay 显示时长，如果为 0 则不自动销毁
 * @param {number} TextSize 显示文本大小
 * @param {number} Ypos  y 坐标(显示位置，相对于默认位置)
 * @param {string} TextWeight 显示文本粗细
 * @param {string} TextColor 显示文本颜色
 * @param {string} BgColor 显示背景颜色
 * @param {number} Xpos x 坐标(显示位置，相对于默认位置)
 * @returns {Gui[]} 返回创建的 Gui 列表
 */
show_tip(Text, Delay := 2500, TextSize := 22, Ypos := 0, TextWeight := 700, TextColor := "A5B1D2", BgColor := "282C34", Xpos := 0) {
    gui_list := []
    screen_num := SysGet(80)
    while (screen_num > 0) {
        MonitorGet(screen_num, &Left, &Top, &Right, &Bottom)
        x := Right - ((Right - Left) / 2) + Xpos
        y := Bottom - 160 + Ypos
        gui_list.Push(_tip())
        screen_num--
    }

    _tip() {
        tip_gui := Gui("-Caption AlwaysOnTop ToolWindow +LastFound")
        tip_gui.SetFont("s" TextSize " c" TextColor " w" TextWeight " q5", "Microsoft YaHei")
        tip_gui.BackColor := BgColor
        tip_gui.AddText("c" TextColor, Text)
        tip_gui.Show("hide")
        tip_gui.GetPos(, , &tip_gui_w, &tip_gui_h)

        x := x - (tip_gui_w / 2 * A_ScreenDPI / 100)
        y := y - tip_gui_h

        WinSetTransparent(230)
        tip_gui.Show("AutoSize X" x " Y" y " NA")

        if (Delay) {
            SetTimer(RemoveTip, Delay) ; 延迟销毁
            RemoveTip() {
                SetTimer(RemoveTip, 0)
                tip_gui.Destroy()
            }
        }

        return tip_gui
    }

    return gui_list
}
