A_TrayMenu.Delete()
A_TrayMenu.Add("暂停/运行", (item, *) => (
    A_IsPaused ? TraySetIcon(A_ScriptDir "/icon/app.png", , 1) : TraySetIcon(A_ScriptDir "/icon/app-pause.png", , 1),
    Suspend(-1),
    Pause(-1),
    A_TrayMenu.ToggleCheck(item)
))
A_TrayMenu.Default := "暂停/运行"
A_TrayMenu.ClickCount := 1

A_TrayMenu.Add()
A_TrayMenu.Add("以管理员权限启动", (*) => Run('*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'))

A_TrayMenu.Add()
A_TrayMenu.Add("重启", (*) => Run('"' A_AhkPath '" "' A_ScriptFullPath '"'))
A_TrayMenu.Add()
A_TrayMenu.Add("退出", (*) => ExitApp())
