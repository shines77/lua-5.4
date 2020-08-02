@rem Script to build lua with MSVC.
@rem Copyright (C) 2005-2017 Mike Pall. See Copyright Notice in lua.h
@rem
@rem Either open a "Visual Studio .NET Command Prompt"
@rem (Note that the Express Edition does not contain an x64 compiler)
@rem -or-
@rem Open a "Windows SDK Command Shell" and set the compiler environment:
@rem     setenv /release /x86
@rem   -or-
@rem     setenv /release /x64
@rem
@rem Then cd to this directory and run this script.

@if not defined INCLUDE goto :FAIL

@setlocal
@set MSVC_ARCH=%Platform% %CommandPromptType% %PreferredToolArchitecture%
@set LUA_COMPILE=cl /nologo /c /O2 /W3 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_STDIO_INLINE=__declspec(dllexport)__inline
@set LUA_LINK=link /nologo
@set LUA_MT=mt /nologo
@set LUA_LIB=lib /nologo /nodefaultlib
@set LUA_DLLNAME=lua54.dll
@set LUA_LIBNAME=lua54.lib

@set MYOBJS=
@set MYSRCS=

@set LUALIB_A=liblua.lib
@set LUALIB_C=liblua.c
@set LUALIB_O=liblua.obj

@set CORE_C=lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c lundump.c lvm.c lzio.c
@set CORE_O=lapi.obj lcode.obj lctype.obj ldebug.obj ldo.obj ldump.obj lfunc.obj lgc.obj llex.obj lmem.obj lobject.obj lopcodes.obj lparser.obj lstate.obj lstring.obj ltable.obj ltm.obj lundump.obj lvm.obj lzio.obj

@set LIB_C=lauxlib.c lbaselib.c lcorolib.c ldblib.c liolib.c lmathlib.c loadlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c linit.c
@set LIB_O=lauxlib.obj lbaselib.obj lcorolib.obj ldblib.obj liolib.obj lmathlib.obj loadlib.obj loslib.obj lstrlib.obj ltablib.obj lutf8lib.obj linit.obj

@set BASE_C=%CORE_C% %LIB_C% %MYSRCS%
@set BASE_O=%CORE_O% %LIB_O% %MYOBJS%

@set LUA_T=lua.exe
@set LUA_A=lua54.dll
@set LUA_C=lua.c
@set LUA_O=lua.obj

@set LUAC_T=luac.exe
@set LUAC_C=luac.c
@set LUAC_O=luac.obj

@set ALL_T=%LUA_A% %LUA_T% %LUAC_T%
@set ALL_A=%LUA_A%
@set ALL_X=%BASE_C% %LUA_C% %LUAC_C%
@set ALL_O=%BASE_O% %LUA_O% %LUAC_O%

@if "%1" neq "debug" goto :NODEBUG
@shift
@set LUA_COMPILE=%LUA_COMPILE% /Zi
@set LUA_LINK=%LUA_LINK% /debug
:NODEBUG
@if "%1"=="static" goto :STATIC
%LUA_COMPILE% /I "." /MD /DLUA_BUILD_AS_DLL %BASE_C%
@if errorlevel 1 goto :BAD
%LUA_LINK% /DLL /out:%LUA_DLLNAME% %BASE_O%
@if errorlevel 1 goto :BAD
@goto :MTDLL
:STATIC
%LUA_COMPILE% /I "." %BASE_C%
@if errorlevel 1 goto :BAD
%LUA_LIB% /OUT:%LUA_LIBNAME% %BASE_O%
@if errorlevel 1 goto :BAD
@goto :MTDLL
:MTDLL
if exist %LUA_DLLNAME%.manifest^
  %LUA_MT% -manifest %LUA_DLLNAME%.manifest -outputresource:%LUA_DLLNAME%;2

%LUA_COMPILE% lua.c
@if errorlevel 1 goto :BAD
%LUA_LINK% /out:lua.exe lua.obj %LUA_LIBNAME%
@if errorlevel 1 goto :BAD
if exist lua.exe.manifest^
  %LUA_MT% -manifest lua.exe.manifest -outputresource:lua.exe

@rem STATIC LIB
%LUA_COMPILE% /I "." %BASE_C%
@if errorlevel 1 goto :BAD
%LUA_LIB% /OUT:%LUA_LIBNAME% %BASE_O%
@if errorlevel 1 goto :BAD

%LUA_COMPILE% luac.c
@if errorlevel 1 goto :BAD
%LUA_LINK% /out:luac.exe luac.obj %LUA_LIBNAME%
@if errorlevel 1 goto :BAD
if exist luac.exe.manifest^
  %LUA_MT% -manifest luac.exe.manifest -outputresource:luac.exe

@echo.
@echo === Successfully built Lua for Windows/%MSVC_ARCH% ===

@goto :END
:BAD
@echo.
@echo *******************************************************
@echo *** Build FAILED -- Please check the error messages ***
@echo *******************************************************
@goto :END
:FAIL
@echo You must open a "Visual Studio .NET Command Prompt" to run this script
:END
