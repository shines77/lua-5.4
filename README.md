# lua-5.4

This is Lua 5.4.0, released on 18 Jun 2020.

For installation instructions, license details, and
further information about Lua, see doc/readme.html.

## [中文 / Chinese]

这是 `Lua` 5.4.0，本人参考 `luajit` 2.05 的 `msvcbuild.bat`，改了一下，可以在 `Windows` 下使用 `MSVC` 编译，并且提供了编译后的 `Windows` 版可执行文件。

## 使用 MSVC 编译

打开一个 "`Visual Studio 命令行提示`" (x86 或 x64 均可), 例如：

`VS2015 x64 本机工具命令提示符`。

切换到本仓库源代码所在的根目录下，然后输入以下命令:

```bash
cd src
msvcbuild.bat
```

然后运行 `msvcbuild.bat`，等待一会，即编译完成。

## 常见问题

执行命令以后，如果看到如下的提示：

```bash
You must open a "Visual Studio .NET Command Prompt" to run this script
```

则说明你的命令行终端不是 `Visual Studio` 的命令行提示符。

---------------------------------------------------------------------------------

## [English]

This is `Lua` 5.4.0, I refer to `luajit` 2.05 write a `msvcbuild.bat`, and now you can compile it use MSVC under windows. And I have uploaded the executable file of Windows version.

## Building with MSVC

Open a "`Visual Studio Command Prompt`" (either x86 or x64),

cd to the root of your repository directory and run these commands:

```bash
cd src
msvcbuild.bat
```

Check the `msvcbuild.bat` file for more options. Then follow the installation instructions below.

## FAQ

After executing the command, if you see the following prompt:

```bash
You must open a "Visual Studio .NET Command Prompt" to run this script
```

Indicates that your command line terminal is not a command prompt for visual studio.

## Fibonacci Test

Run the `fibonacci.lua` use `lua` on Windows:

```bash
cd test
.\fibonacci.bat
```

## fibonacci.lua

Source code of `fibonacci.lua`:

```lua
function fibonacci(n)
    if n >= 3 then
        return fibonacci(n - 2) + fibonacci(n - 1)
    else
        return 1
    end
end

function main()
    print("Enter a number [1-45]: ")
    local n = io.read("*number")

    print("");
    local startTime = os.clock()
    local fib_n = fibonacci(n)
    local endTime = os.clock()

    print("fibonacci(40) = "..fib_n.."\n")
    print("Used time: "..(endTime - startTime).." seconds")
end

main()
```

## Test Result

```bash
Enter a number [1-45]:
40

fibonacci(40) = 102334155

Used time: 9.90 seconds
```
