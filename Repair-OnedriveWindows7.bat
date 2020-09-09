::Script to add the Task Scheduler to fix the white box issue with Onedrive on Windows 7
@echo off
cls
setlocal 

del "%appdata%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk"

::robocopy %~dp0 "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" %~n0%~x0

cd /d %localappdata%\Microsoft\Onedrive

for /f "tokens=1 delims=_" %%1 in ('dir /b /ad /on 20.*') do (
    set latestdir=%%1
)

Onedrive.exe /shutdown
cd %latestdir%
path %CD%;%PATH%
cd ..
start onedrive.exe /background
exit 0
