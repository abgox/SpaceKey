/**
 * 调节屏幕亮度
 * win11+ 可用，win10 及以下未知
 * @param {number} offset 亮度的偏移量，负数降低亮度，正数提高亮度
 * @returns {number} 返回更改后的亮度值(0-100)，返回 -1 则表示不支持
 * @example
 * change_brightness(10) ; 亮度提高 10
 * change_brightness(-10) ; 亮度降低 10
 */
change_brightness(offset) {
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
