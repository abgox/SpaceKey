/**
 * 基于 key 目录动态创建 key.ahk，包含其目录下所有 ahk 文件的 #Include
 */
generate_key_file() {
    temp_dir := A_ScriptDir "\temp"
    include_file := temp_dir "\key.ahk"

    if (!DirExist(temp_dir)) {
        DirCreate(temp_dir)
    }

    include_content := ""
    loop files "key\*.ahk", "R" {
        path := StrReplace(A_LoopFilePath, "key\", "")
        if (path != "key.ahk" && A_LoopFileExt == "ahk") {
            include_content .= "#Include " path "`n"
        }
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
