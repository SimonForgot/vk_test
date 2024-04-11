@echo off
set INSTALL_DIR=./install

if "%1"=="" (
    RMDIR /S /Q build
    ::vs2017 :"Visual Studio 15 2017 Win64"    
    ::vs2019 :"Visual Studio 16 2019" -A x64
    ::vs2022 :"Visual Studio 17 2022" -A x64
    cmake -Bbuild -G "Visual Studio 16 2019" -A x64 ^
    -Dglfw3_DIR="D:\app\glfw\lib\cmake\glfw3" ^
    -Dglm_DIR="D:\app\glm\cmake\glm" ^
    ::-DCMAKE_VERBOSE_MAKEFILE=ON ^
    -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR%
)else if "%1"=="c" (
    cmake --build build -j36 --config Debug --clean-first
)else if "%1"=="i" (
    RMDIR /S /Q %INSTALL_DIR%
    cmake --install build
)else if "%1"=="r" (
    cmake --build build --target run --config Debug
)

::build & install command
::cmake --build build -j36 --target install --config Release