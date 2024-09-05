/**
 * 提示函数
 * 默认位置为屏幕底部以上200像素居中
 * @param {String} Text  显示文本
 * @param {number} delay 显示时长
 * @param {number} TextSize 显示文本大小
 * @param {number} Ypos  y坐标(显示位置,需要相对于默认位置设置)
 * @param {string} TextWeight 显示文本粗细
 * @param {string} TextColor 显示文本颜色
 * @param {string} BgColor 显示背景颜色
 * @param {number} Xpos x坐标(显示位置,需要相对于默认位置设置)
 * @returns {void}
 */
showTip(Text, delay := 2500, TextSize := 22, Ypos := 0, TextWeight := 700, TextColor := "A5B1D2", BgColor := "282C34", Xpos := 0) {
    screen_num := SysGet(80)
    while (screen_num > 0) {
        MonitorGet(screen_num, &Left, &Top, &Right, &Bottom)
        x := Right - ((Right - Left) / 2) + Xpos
        y := Bottom - 160 + Ypos
        _showTip(Text, delay, TextSize, y, TextWeight, TextColor, BgColor, x)
        screen_num--
    }

    _showTip(Text, delay := delay, TextSize := TextSize, Ypos := Ypos, TextWeight := TextWeight, TextColor := TextColor, BgColor := BgColor, Xpos := Xpos) {
        TipGui := Gui("-Caption AlwaysOnTop ToolWindow +LastFound")
        TipGui.SetFont("s" TextSize " c" TextColor " w" TextWeight " q5", "Microsoft YaHei")
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

/**
 * 检测是否有激活窗口，无则return
 * @param {string} Title 指定检测窗口(如"A","ahk_exe Code.exe")
 * @param {string} errTip  报错提示
 * @returns 0 -- 检测失败 ； 2 -- 检测成功
 * @example hasActiveWindow("检测失败","A")
 */
hasActiveWindow(errTip := "未检测到窗口激活",Title := "A") {
    Try {    ; 尝试获取激活窗口，如果没有则return
        WinGetTitle(Title)
        if(WinGetTitle(Title) = ""){
            throw
        }
    } Catch {
        showTip(errTip)
        return 0
    }
    return 1
}

/**
 * 调节屏幕亮度
 * win11+ 版本可用
 * @param {number} offset 亮度的偏移量，负数降低亮度，正数提高亮度
 * @returns {number} 返回更改后的亮度值(0-100)，返回 -1 则表示不支持
 * @example
 * changeBrightness(10) ; 亮度提高 10
 * changeBrightness(-10) ; 亮度降低 10
 */
changeBrightness(offset) {
	SupportedBRightness := Buffer(256, 0)
	SupportedBRightnessSize := Buffer(4, 0)
	BRightnessSize := Buffer(4, 0)
	BRightness := Buffer(3, 0)

	hLCD := DllCall("CreateFile"
		, "Str", "\\.\LCD"
		, "UInt", 0x80000000 | 0x40000000 ;Read | Write
		, "UInt", 0x1 | 0x2  ; File Read | File Write
		, "UInt", 0
		, "UInt", 0x3        ; open any existing file
		, "UInt", 0
		, "UInt", 0)

	if (hLCD = -1) {
		; 不支持
		return -1
	}

	DevVideo := 0x00000023, BuffMethod := 0, Fileacces := 0
	NumPut("UChar", 0x03, BRightness, 0)      ; 0x01 = Set AC, 0x02 = Set DC, 0x03 = Set both
	NumPut("UChar", 0x00, BRightness, 1)      ; The AC bRightness level
	NumPut("UChar", 0x00, BRightness, 2)      ; The DC bRightness level

	DllCall("DeviceIoControl"
		, "UInt", hLCD
		, "UInt", (DevVideo << 16 | 0x126 << 2 | BuffMethod << 14 | Fileacces) ; IOCTL_VIDEO_QUERY_DISPLAY_BRIGHTNESS
		, "UInt", 0
		, "UInt", 0
		, "UInt", Brightness.Ptr
		, "UInt", 3
		, "UInt", BrightnessSize.Ptr
		, "UInt", 0)

	DllCall("DeviceIoControl"
		, "UInt", hLCD
		, "UInt", (DevVideo << 16 | 0x125 << 2 | BuffMethod << 14 | Fileacces) ; IOCTL_VIDEO_QUERY_SUPPORTED_BRIGHTNESS
		, "UInt", 0
		, "UInt", 0
		, "UInt", SupportedBrightness.Ptr
		, "UInt", 256
		, "UInt", SupportedBrightnessSize.Ptr
		, "UInt", 0)

	ACBRightness := NumGet(BRightness, 1, "UChar")
	ACIndex := 0
	DCBRightness := NumGet(BRightness, 2, "UChar")
	DCIndex := 0
	BufferSize := NumGet(SupportedBRightnessSize, 0, "UInt")
	MaxIndex := BufferSize - 1

	Loop BufferSize {
		ThisIndex := A_Index - 1
		ThisBRightness := NumGet(SupportedBRightness, ThisIndex, "UChar")
		if (ACBRightness = ThisBRightness)
			ACIndex := ThisIndex
		if (DCBRightness = ThisBRightness)
			DCIndex := ThisIndex
	}

	BRightnessIndex := (DCIndex >= ACIndex) ? DCIndex : ACIndex

	BRightnessIndex += offset

	if (BRightnessIndex > MaxIndex) {
		BRightnessIndex := MaxIndex
	}

	if (BRightnessIndex < 0) {
		BRightnessIndex := 0
	}

	NewBRightness := NumGet(SupportedBRightness, BRightnessIndex, "UChar")

	NumPut("UChar", 0x03, BRightness, 0)               ; 0x01 = Set AC, 0x02 = Set DC, 0x03 = Set both
	NumPut("UChar", NewBRightness, BRightness, 1)      ; The AC bRightness level
	NumPut("UChar", NewBRightness, BRightness, 2)      ; The DC bRightness level

	DllCall("DeviceIoControl"
		, "UInt", hLCD
		, "UInt", (DevVideo << 16 | 0x127 << 2 | BuffMethod << 14 | Fileacces) ; IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS
		, "UInt", Brightness.Ptr
		, "UInt", 3
		, "UInt", 0
		, "UInt", 0
		, "UInt", 0
		, "UInt", 0)

	DllCall("CloseHandle", "UInt", hLCD)
	return BRightnessIndex
}

/**
 * 改变窗口透明度
 * @param {number} flag 1/-1 增加/减少
 * @param {string} window_title 窗口标题，默认当前激活窗口
 */
changeTransparence(flag, window_title := "A") {
    if !hasActiveWindow("检测窗口失败，无法设置透明度") {
        return
    }
    transparent := WinGetTransparent(window_title) ? WinGetTransparent(window_title) : 255
    if (flag = 1) {
        if (transparent < 245) {
            transparent := (transparent + 10)
            WinSetTransparent(transparent, window_title)
        } else {
            transparent := 255
            WinSetTransparent("Off", "A")
        }
    } else {
        if (transparent > 5) {
            transparent := (transparent - 10)
            WinSetTransparent(transparent, "A")
        } else {
            transparent := 1    ; 如果为0，则这时，捕捉不到窗口，透明度会因为三元运算符设定为255，周而复始循环
            WinSetTransparent(1, "A")
        }
    }
    return 255 - transparent
}
