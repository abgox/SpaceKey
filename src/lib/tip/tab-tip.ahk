/**
 * 创建一个文本提示(需要按键摧毁)
 * 默认位置为屏幕底部以上 200 像素居中
 * @param {String} Text  显示文本
 * @param {string} Ypos  y 坐标(显示位置)
 * @param {number} TextSize 显示文本大小
 * @param {number} TextWeight 显示文本粗细
 * @param {string} TextColor 显示文本颜色
 * @param {string} BgColor 显示背景颜色
 * @param {string} Xpos x 坐标(显示位置)
 * @returns {void}
 */
tabTip(Text, TextSize := 22, Ypos := 0, TextWeight := 700, TextColor := "A5B1D2", BgColor := "282C34", Xpos := 0) {
    screen_num := SysGet(80)
    callback := []
    while (screen_num > 0) {
        MonitorGet(screen_num, &Left, &Top, &Right, &Bottom)
        x := Right - ((Right - Left) / 2) + Xpos
        y := Bottom - 160 + Ypos
        _Tip(Text, screen_num, TextSize, y, TextWeight, TextColor, BgColor, x)
        screen_num--
    }

    /**
     * 等待按键，并返回按键名称
     * @param {string} Options  V 表示除返回按键名称外，按键功能正常触发
     * @returns {string} 返回按键名称
     */
    wait_any_key(Options := "") {
        ih := InputHook(Options)
        if !InStr(Options, "V")
            ih.VisibleNonText := false
        ih.KeyOpt("{All}", "E")  ; 结束
        ih.Start()
        ih.Wait()
        return ih.EndKey  ; 返回按键名称
    }

    _Tip(Text, index, TextSize := TextSize, Ypos := Ypos, TextWeight := TextWeight, TextColor := TextColor, BgColor := BgColor, Xpos := Xpos) {
        tabTip_gui := Gui("-Caption AlwaysOnTop ToolWindow +LastFound")
        tabTip_gui.SetFont("s" TextSize " c" TextColor " w" TextWeight " q5", "微软雅黑")
        tabTip_gui.BackColor := BgColor, tabTip_gui.MarginX := "5", tabTip_gui.MarginY := "5"
        tabTip_gui.AddText("c" TextColor, Text)
        tabTip_gui.Show("hide")
        tabTip_gui.GetPos(, , &tabTip_gui_w, &tabTip_gui_h)

        Xpos := Xpos - (tabTip_gui_w / 2 * A_ScreenDPI / 100)
        Ypos := Ypos - tabTip_gui_h
        WinSetTransparent(230)
        tabTip_gui.Show("AutoSize X" Xpos " Y" Ypos " NA")

        Destroy() {
            tabTip_gui.Destroy()
        }
        callback.Push(Destroy)

        if (index = 1 && wait_any_key()) {
            ; 当有任何键按下后，删除窗口
            try {
                for k in callback {
                    k()
                }
            }
        }
    }
}
