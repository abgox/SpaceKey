/**
 * - 基于 key 和 custom 目录动态创建 key.ahk，包含其目录下所有 ahk 文件的 #Include
 * - custom 目录下的文件会覆盖 base 目录下的同名文件，以实现自定义
 */
generate_key_file() {
    temp_dir := A_ScriptDir "\temp"
    include_file := temp_dir "\key.ahk"

    if (!DirExist(temp_dir)) {
        DirCreate(temp_dir)
    }

    key_file := ":"
    loop files "base\*.ahk", "R" {
        key_file .= "..\" A_LoopFilePath ":"
    }
    loop files "custom\*.ahk", "R" {
        path := "..\" A_LoopFilePath
        origin := StrReplace(path, "custom\", "base\")
        if (InStr(key_file, ":" origin ":")) {
            key_file := StrReplace(key_file, ":" origin ":", ":" path ":")
            continue
        }
        key_file .= path ":"
    }

    include_content := ""
    for path in StrSplit(key_file, ":") {
        if (path == "") {
            continue
        }
        include_content .= '#Include "*i ' path '"`n'
    }

    if (FileExist(include_file)) {
        old_content := FileRead(include_file)
        if (include_content == old_content) {
            return
        }
        FileDelete(include_file)
    }

    FileAppend(include_content, include_file)
    Run('"' A_AhkPath '" "' A_ScriptFullPath '"')
}
