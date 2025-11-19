/**
 * 两次键击
 * @param {Func} fn1 键击一次执行的行为
 * @param {Func} fn2  键击两次执行的行为
 * @param {number} Sleep  检测键击持续时长
 * @param {string} ThisHotkey 这个参数保存的是按键，不需要传参
 * @returns {void}
 */
hit_key_double(fn1, fn2, Sleep := 250, ThisHotkey := 'ThisHotkey')
{
    static key_count := 0
    if key_count > 0
    {
        key_count += 1
        return
    }
    key_count := 1
    SetTimer After, -Sleep
    After() {
        if (key_count = 1) {
            fn1()
        } else if (key_count = 2) {
            fn2()
        }
        key_count := 0
    }
}


/**
 * 三次键击
 * @param {Func} fn1 键击一次执行的行为
 * @param {Func} fn2  键击两次执行的行为
 * @param {Func} fn3  键击三次执行的行为
 * @param {number} Sleep  检测键击持续时长
 * @param {string} ThisHotkey 这个参数保存的是按键，不需要传参
 * @returns {void}
 */
hit_key_triple(fn1, fn2, fn3, Sleep := 400, ThisHotkey := 'ThisHotkey')
{
    static key_count := 0
    if key_count > 0
    {
        key_count += 1
        return
    }
    key_count := 1
    SetTimer After, -Sleep
    After() {
        if (key_count = 1) {
            fn1()
        } else if (key_count = 2) {
            fn2()
        } else if (key_count = 3) {
            fn3()
        }
        key_count := 0
    }
}

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
