<h1 align="center">✨<a href="https://spacekey.abgox.com/">SpaceKey</a>✨</h1>

<p align="center">
    <a href="https://github.com/abgox/SpaceKey">Github</a> |
    <a href="https://gitee.com/abgox/SpaceKey">Gitee</a>
</p>

<p align="center">
    <a href="https://github.com/abgox/SpaceKey/blob/main/license">
        <img src="https://img.shields.io/github/license/abgox/SpaceKey" alt="license" />
    </a>
    <a href="https://www.microsoft.com/windows">
        <img src="https://img.shields.io/badge/Target-Windows-blue" alt="target" />
    </a>
    <a href="https://github.com/abgox/SpaceKey">
        <img src="https://img.shields.io/github/languages/code-size/abgox/SpaceKey" alt="code size" />
    </a>
    <a href="https://github.com/abgox/SpaceKey">
        <img src="https://img.shields.io/github/repo-size/abgox/SpaceKey" alt="repo size" />
    </a>
    <a href="https://github.com/abgox/SpaceKey">
        <img src="https://img.shields.io/github/created-at/abgox/SpaceKey" alt="created" />
    </a>
</p>

---

<p align="center">
  <strong>喜欢这个项目？请给它 Star ⭐️ 或 <a href="https://abgox.com/donate">赞赏 💰</a></strong>
</p>

## 介绍

一套以空格键为核心的按键映射方案，用于优化输入体验，基于 [AutoHotkey(AHK)](https://github.com/AutoHotkey/AutoHotkey) 编写

## 安装

1.  添加 [abyss](https://abyss.abgox.com) bucket ([Github](https://github.com/abgox/abyss) 或 [Gitee](https://gitee.com/abgox/abyss))

2.  安装 `abgox.SpaceKey`

    ```shell
    scoop install abyss/abgox.SpaceKey
    ```

## 目录结构

> [!Tip]
>
> - `base`: 内置的按键映射
>   - 包含 `core` 和 `window`，未来可能会添加其他目录
>   - 由于 `custom` 的存在，`base` 可能会根据我的需求变化而变动
>   - 如果你想要绝对的稳定性，可以通过 `custom` 目录覆盖它们
> - `custom`: 自定义按键映射
>   - 如果和 `base` 目录下的文件名相同，则 `custom` 的优先级更高
>   - 举个例子，假设你想要修改 `base/core/s.ahk` 中对符号输入的映射
>   - 你可以创建 `custom/core/s.ahk`，则它会代替 `base/core/s.ahk` 生效
>   - 你可以通过 `temp/key.ahk` 查看最终生效的 `.ahk` 文件
>   - 推荐的编辑工具：
>     - 编辑器: [Visual Studio Code](https://code.visualstudio.com/)
>       ```shell
>       scoop install abyss/Microsoft.VisualStudioCode
>       ```
>     - AutoHotkey 语言扩展: [thqby.vscode-autohotkey2-lsp](https://marketplace.visualstudio.com/items?itemName=thqby.vscode-autohotkey2-lsp) ([Github](https://github.com/thqby/vscode-autohotkey2-lsp))

```txt
SpaceKey/
├── SpaceKey.bat         # 启动脚本
├── src/
│   ├── base/            # 内置的默认方案
│   │   ├── core/        # 核心映射
│   │   ├── window/      # 窗口映射
│   │   └── ...          # 其他默认映射
│   ├── custom/          # 用户的自定义方案
│   │   ├── core/        # 自定义核心映射
│   │   ├── window/      # 自定义窗口映射
│   │   └── ...          # 其他自定义映射
│   ├── temp/key.ahk     # 动态生成的 #Include 文件
│   └── ...              # 其他文件，请忽略它们
└── ...
```
