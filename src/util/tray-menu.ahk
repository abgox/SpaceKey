A_TrayMenu.Delete()
A_TrayMenu.Add("以管理员权限启动", (*) => Run('*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'))
if (A_IsAdmin) {
    A_TrayMenu.Check("以管理员权限启动")
}

checkStartup() {
    return FileExist(A_Startup "\abgox.SpaceKey.lnk")
}
A_TrayMenu.Add()
A_TrayMenu.Add("开机自启动", toggleStartup)

toggleStartup(item, *) {
    static startup := checkStartup()

    if (startup) {
        try {
            FileDelete(A_Startup "\abgox.SpaceKey.lnk")
        }
    } else {
        FileCreateShortcut(A_AhkPath, A_Startup "\abgox.SpaceKey.lnk", , '"' A_ScriptFullPath '"', fileDesc, A_ScriptDir "\icon\app.ico", , , 7)
    }
    startup := !startup
    A_TrayMenu.ToggleCheck("开机自启动")
}

if (checkStartup()) {
    A_TrayMenu.Check("开机自启动")
}

A_TrayMenu.Add()

A_TrayMenu.Add("暂停/运行", (item, *) => (
    A_IsPaused ? TraySetIcon(A_ScriptDir "/icon/app.png", , 1) : TraySetIcon(A_ScriptDir "/icon/app-pause.png", , 1),
    Suspend(-1),
    Pause(-1),
    A_TrayMenu.ToggleCheck(item)
))
A_TrayMenu.Default := "暂停/运行"
A_TrayMenu.ClickCount := 1

A_TrayMenu.Add()
A_TrayMenu.Add("重启", (*) => Run('"' A_AhkPath '" "' A_ScriptFullPath '"'))

A_TrayMenu.Add()
A_TrayMenu.Add("关于", (*) => create_unique_gui(about_gui).Show())
about_gui(info) {
    g := Gui(, "关于 - " A_ScriptName)
    g.SetFont("s12", "Microsoft YaHei")
    g.AddText("Center w" info.w - g.MarginX * 2, fileDesc).Focus()
    g.AddLink("xs", '1. 官网: <a href="https://spacekey.abgox.com">spacekey.abgox.com</a>')
    g.AddLink("xs", '2. Github: <a href="https://github.com/abgox/SpaceKey">github.com/abgox/SpaceKey</a>')
    g.AddLink("xs", '3. Gitee: <a href="https://gitee.com/abgox/SpaceKey">gitee.com/abgox/SpaceKey</a>')
    g.AddText("xs cGray", '小技巧: 单击任务栏中的托盘图标可快速切换【暂停/运行】')
    return g
}

A_TrayMenu.Add()
A_TrayMenu.Add("退出", (*) => ExitApp())
