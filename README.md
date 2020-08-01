# lua-5.4

This is Lua 5.4.0, released on 18 Jun 2020.

For installation instructions, license details, and
further information about Lua, see doc/readme.html.

## [Chinese/中文]

这是 `Lua` 5.4.0，本人参考 `luajit` 2.05 的 `msvcbuild.bat`，改了一下，可以在 `Windows` 下使用 `MSVC` 编译。

## 使用 MSVC 编译

打开一个 "`Visual Studio 命令行提示`" (x86 或 x64 均可), 例如：

`VS2015 x64 本机工具命令提示符`。

切换到本仓库源代码所在的根目录下，然后输入以下命令:

```bash
cd src
msvcbuild.bat
```

然后运行 `msvcbuild.bat`，等待一会，即编译完成。

## FAQ

执行命令以后，如果看到如下的提示：

```bash
You must open a "Visual Studio .NET Command Prompt" to run this script
```

则说明你的命令行终端不是 `Visual Studio` 的命令行提示符。

## [English]

This is `Lua` 5.4.0, I refer to `luajit` 2.05 write a `msvcbuild.bat`, and now you can compile it use MSVC under windows.

## Building with MSVC

Open a "`Visual Studio Command Prompt`" (either x86 or x64),

cd to the root of your repository directory and run these commands:

```bash
cd src
msvcbuild.bat
```

Check the `msvcbuild.bat` file for more options. Then follow the installation instructions below.

## FAQ

After executing the command, if you see the following prompt

```bash
You must open a "Visual Studio .NET Command Prompt" to run this script
```

Indicates that your command line terminal is not a command prompt for visual studio.
