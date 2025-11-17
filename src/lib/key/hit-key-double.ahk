/**
 * 双击执行
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
