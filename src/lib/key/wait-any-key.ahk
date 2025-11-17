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
