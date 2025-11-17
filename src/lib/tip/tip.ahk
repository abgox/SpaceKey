/**
 * 创建一个文本提示
 * 默认位置为屏幕底部以上 200 像素居中
 * @param {String} Text  显示文本
 * @param {number} delay 显示时长
 * @param {number} TextSize 显示文本大小
 * @param {number} Ypos  y 坐标(显示位置,需要相对于默认位置设置)
 * @param {string} TextWeight 显示文本粗细
 * @param {string} TextColor 显示文本颜色
 * @param {string} BgColor 显示背景颜色
 * @param {number} Xpos x 坐标(显示位置,需要相对于默认位置设置)
 * @returns {void}
 */
Tip(Text, delay := 2500, TextSize := 22, Ypos := 0, TextWeight := 700, TextColor := "A5B1D2", BgColor := "282C34", Xpos := 0) {
    screen_num := SysGet(80)
    while (screen_num > 0) {
        MonitorGet(screen_num, &Left, &Top, &Right, &Bottom)
        x := Right - ((Right - Left) / 2) + Xpos
        y := Bottom - 160 + Ypos
        _Tip(Text, delay, TextSize, y, TextWeight, TextColor, BgColor, x)
        screen_num--
    }

    _Tip(Text, delay := delay, TextSize := TextSize, Ypos := Ypos, TextWeight := TextWeight, TextColor := TextColor, BgColor := BgColor, Xpos := Xpos) {
        TipGui := Gui("-Caption AlwaysOnTop ToolWindow +LastFound")
        TipGui.SetFont("s" TextSize " c" TextColor " w" TextWeight " q5", "微软雅黑")
        TipGui.BackColor := BgColor, TipGui.MarginX := "5", TipGui.MarginY := "5"
        TipGui.AddText("c" TextColor, Text)
        TipGui.Show("hide")
        TipGui.GetPos(, , &TipGui_w, &TipGui_h)

        Xpos := Xpos - (TipGui_w / 2 * A_ScreenDPI / 100)
        Ypos := Ypos - TipGui_h

        WinSetTransparent(230)
        TipGui.Show("AutoSize X" Xpos " Y" Ypos " NA")

        SetTimer(RemoveTip, delay) ; 延迟销毁
        RemoveTip() {
            SetTimer(RemoveTip, 0)
            TipGui.Destroy()
        }
    }
}
