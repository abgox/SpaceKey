; w(window): 窗口相关
Space & w:: return
Space & w Up:: {
    for key in [
        "Ctrl", "Alt", "Shift", "Tab", "Enter",
        "Left", "Right", "Up", "Down", "PgUp", "PgDn", "Home", "End",
    ]
        SendInput("{" key " Up}")
}
