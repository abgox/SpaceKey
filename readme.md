<h1 align="center">✨<a href="https://spacekey.abgox.com/">SpaceKey</a>✨</h1>

<p align="center">
    <a href="https://github.com/abgox/SpaceKey">Github</a> |
    <a href="https://gitee.com/abgox/SpaceKey">Gitee</a>
</p>

<p align="center">
    <a href="https://github.com/abgox/SpaceKey/blob/main/license">
        <img src="https://img.shields.io/github/license/abgox/SpaceKey" alt="license" />
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

一套以空格键为核心的按键映射方案，优化输入体验

## 安装

1.  添加 [abyss](https://abyss.abgox.com) bucket ([Github](https://github.com/abgox/abyss) 或 [Gitee](https://gitee.com/abgox/abyss))

2.  安装 `abgox.SpaceKey`

    ```shell
    scoop install abyss/abgox.SpaceKey
    ```

## 目录结构

> [!Tip]
>
> - `key` 目录下的核心按键映射会尽量保持不变
> - `window` 目录下的窗口按键映射会根据我的需求变化而变动
>   - 如果只使用 `key`，则不会受到影响

```txt
SpaceKey/
├── SpaceKey.bat     # 启动脚本
├── src/
    ├── key/         # 按键映射(核心/全局)
    ├── window/      # 按键映射(应用窗口)
    └── ...          # 其他文件
└── ...              # 其他文件
```
