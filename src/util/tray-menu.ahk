A_TrayMenu.Delete()
A_TrayMenu.Add("使用指南", (*) => create_unique_gui(guide_gui).Show())
guide_gui(info) {
    g := Gui(, "SpaceKey - 使用指南")
    g.SetFont("s16", "Microsoft YaHei")
    g.AddLink(, '1. 左键单击托盘图标可以切换软件状态(暂停/运行)')
    g.AddLink(, '2. 如果 Space (空格键) 没有释放，再次按下即可恢复')
    g.AddLink(, '3. 更多详情请参考 <a href="https://spacekey.abgox.com">官网</a> 或者源代码仓库 <a href="https://github.com/abgox/SpaceKey">GitHub</a>、<a href="https://gitee.com/abgox/SpaceKey">Gitee</a>')
    return g
}

A_TrayMenu.Add()
A_TrayMenu.Add("开机自启动", toggleStartup)

lnkPath := A_Startup "\abgox.SpaceKey.lnk"

checkStartup() {
    if (FileExist(lnkPath)) {
        FileGetShortcut(lnkPath, &target, , &args)
        if (target == A_AhkPath && args == '"' A_ScriptFullPath '"') {
            return true
        }
    }
    return false
}
toggleStartup(item, *) {
    static startup := checkStartup()

    if (startup) {
        try {
            FileDelete(lnkPath)
        }
    } else {
        FileCreateShortcut(A_AhkPath, lnkPath, , '"' A_ScriptFullPath '"', fileDesc, A_ScriptDir "\icon\app.ico", , , 7)
    }
    startup := !startup
    A_TrayMenu.ToggleCheck("开机自启动")
}

if (checkStartup()) {
    A_TrayMenu.Check("开机自启动")
}

A_TrayMenu.Add()
A_TrayMenu.Add("以管理员权限启动", (*) => (Run('*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"')))
if (A_IsAdmin) {
    A_TrayMenu.Check("以管理员权限启动")
}

A_TrayMenu.Add()
A_TrayMenu.Add("打开软件目录", (*) => (Run("explorer.exe /select," A_ScriptFullPath "\..\")))

A_TrayMenu.Add()
A_TrayMenu.Add("关于", (*) => create_unique_gui(about_gui).Show())
about_gui(info) {
    g := Gui(, "关于 - " A_ScriptName)
    g.SetFont("s16", "Microsoft YaHei")
    g.AddText("Center w" info.w - g.MarginX * 2, fileDesc).Focus()
    g.AddLink(, '1. 官网: <a href="https://spacekey.abgox.com">spacekey.abgox.com</a>')
    g.AddLink(, '2. GitHub: <a href="https://github.com/abgox/SpaceKey">github.com/abgox/SpaceKey</a>')
    g.AddLink(, '3. Gitee: <a href="https://gitee.com/abgox/SpaceKey">gitee.com/abgox/SpaceKey</a>')
    return g
}

A_TrayMenu.Add("重启", (*) => (Run('"' A_AhkPath '" "' A_ScriptFullPath '"')))

A_TrayMenu.Add()
A_TrayMenu.Add("退出", (*) => (ExitApp()))
