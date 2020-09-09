#Opens an administrative cmd on the remote machine indicated

@echo off
set /p Computername=Enter Computername:
PsExec.exe \\%computername% -i -s cmd
