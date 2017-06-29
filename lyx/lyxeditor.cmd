@echo off
SETLOCAL enabledelayedexpansion
set file=%1
set row=%2
REM remove quotes from variables 
set file=!file:"=!
set row=!row:"=!
%comspec% /q /c (@echo LYXCMD:revdvi:server-goto-file-row:%file% %row%)> \\.\pipe\lyxpipe.in&&type \\.\pipe\lyxpipe.out
endlocal