@title Change SCCM Remote Permission
@echo off

::This scripts disables or enables the permission for SCCM remote control

echo ** HOSTNAME REQUEST
set /p computer=Enter the hostname please:

:start
ECHO.
ECHO 1. Print Disable
ECHO 2. Print Enable
set choice=
set /p choice = Write 1 to Disable, 2 to Enable

if '%choice%'=='1' goto disable
if '%choice%'=='2' goto enable

ECHO "%choice%" is not valid, please type a valid choice
ECHO.
goto start


:disable
psexec -h \\%computer% cmd /c (^
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SMS\Client\Client Components\Remote Control" /v "Permission Required" /f ^
& reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SMS\Client\Client Components\Remote Control" /v "Permission Required" /t REG_DWORD /d 0 /f ^
)

:enable
psexec -h \\%computer% cmd /c (^
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SMS\Client\Client Components\Remote Control" /v "Permission Required" /f ^
& reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SMS\Client\Client Components\Remote Control" /v "Permission Required" /t REG_DWORD /d 1 /f ^
)


echo **
echo ** OPERATION IS DONE
echo **
::exit
