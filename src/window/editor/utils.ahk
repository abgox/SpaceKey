editorSideTip(Text, TextSize := 22, Ypos := 0, TextWeight := 700, TextColor := "A5B1D2", BgColor := "282C34", Xpos := 0) {
    screen_num := SysGet(80)
    sideTip_list := []
    while (screen_num > 0) {
        MonitorGet(screen_num, &Left, &Top, &Right, &Bottom)
        x := Right - ((Right - Left) / 2) + Xpos
        y := Bottom - 160 + Ypos
        sideTip_list.Push(_Tip(Text, screen_num, TextSize, y, TextWeight, TextColor, BgColor, x))
        screen_num--
    }

    _Tip(Text, index, TextSize := TextSize, Ypos := Ypos, TextWeight := TextWeight, TextColor := TextColor, BgColor := BgColor, Xpos := Xpos) {
        sideTip_gui := Gui("-Caption AlwaysOnTop ToolWindow +LastFound")
        sideTip_gui.SetFont("s" TextSize " c" TextColor " w" TextWeight " q5", "微软雅黑")
        sideTip_gui.BackColor := BgColor, sideTip_gui.MarginX := "5", sideTip_gui.MarginY := "5"
        sideTip_gui.AddText("c" TextColor, Text)
        sideTip_gui.Show("hide")
        sideTip_gui.GetPos(, , &sideTip_gui_w, &sideTip_gui_h)

        Xpos := Xpos - (sideTip_gui_w / 2 * A_ScreenDPI / 100)
        Ypos := Ypos - sideTip_gui_h
        WinSetTransparent(230)
        sideTip_gui.Show("AutoSize X" Xpos " Y" Ypos " NA")
        return sideTip_gui
    }
    return sideTip_list
}
