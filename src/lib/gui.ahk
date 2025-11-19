/**
 * - 创建 Gui 对象。
 * - 能够获取窗口最终的坐标和宽高，方便配置控件(如按钮宽度)。
 * - 原理: 通过先执行一次隐藏显示来获取信息，相当于实际会运行两次
 * @param {Func} callback
 * - 回调函数接受形参 `info`
 *    - `info.x`,`info.y`,`info.w`,`info.h`: 最终计算得到的窗口坐标和宽高。
 *    - 当执行隐藏显示时，`info.i` 为 `1`，否则为 `0`
 * @returns {Gui} 返回 Gui 对象
 * @example
 * create_gui(hello_gui).Show()
 * hello_gui(info) {
 *     g := Gui()
 *     g.SetFont("s12", "Microsoft YaHei")
 *     g.AddText(, "xxxxxxxxxxxxxxxxxxx")
 *     ; 第一次隐藏显示，可以通过它在合适的地方直接返回，减少多余的执行
 *     if (info.i) {
 *         return g
 *     }
 *     w := info.w
 *     bw := w - g.MarginX * 2
 *     ; 其他控件...
 *     g.AddButton("w" bw, "确定")
 *     return g
 * }
 */
create_gui(callback) {
    g := callback({ x: 0, y: 0, w: 0, h: 0, i: 1 })
    g.Show("Hide")
    g.GetPos(&x, &y, &w, &h)
    g.Destroy()
    return callback({ x: x, y: y, w: w, h: h, i: 0 })
}


/**
 * 创建一个唯一的 Gui
 * @param {Func} callback
 * - 回调函数接受形参 `info`
 *    - `info.x`,`info.y`,`info.w`,`info.h`: 最终计算得到的窗口坐标和宽高。
 *    - 当执行隐藏显示时，`info.i` 为 `1`，否则为 `0`
 * @returns {Gui} 返回 Gui 对象
 * @example
 * create_unique_gui(hello_gui).Show()
 * hello_gui(info) {
 *     g := Gui()
 *     g.SetFont("s12", "Microsoft YaHei")
 *     g.AddText(, "xxxxxxxxxxxxxxxxxxx")
 *     ; 第一次隐藏显示，可以通过它在合适的地方直接返回，减少多余的执行
 *     if (info.i) {
 *         return g
 *     }
 *     w := info.w
 *     bw := w - g.MarginX * 2
 *     ; 其他控件...
 *     g.AddButton("w" bw, "确定")
 *     return g
 * }
 */
create_unique_gui(callback) {
    static w := Map()
    g := create_gui(callback)
    g.GetPos(, , &width, &height)
    ; 基本确保唯一性
    id := g.Title "_" width "_" height
    if (w.Has(id)) {
        try {
            w.Get(id).Destroy()
            w.Delete(id)
        }
    }
    w.Set(id, g)
    return g
}
