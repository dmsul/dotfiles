REM Turn off hibernation mode
powercfg -h off
REM Set pagefile to 512 MB
start /wait /b powershell -command "Set-ItemProperty -Path 'registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PagingFiles' -Value 'c:\pagefile.sys 512 512'"
REM Disable system protection
start /wait /b powershell -command "Disable-ComputerRestore -Drive 'C:\'"
start /wait /b powershell -command "Disable-ComputerRestore -Drive 'D:\'"
REM Disable defrag
schtasks /change /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /disable
