@echo off & cd /d "%~dp0"
fsutil dirty query %systemdrive% >nul && goto:GA || nsudo -U:E -P:E -UseCurrentConsole "%~0" %* && exit /b
:GA
echo.
echo [33m add to Desktop Right-click [0m
:: menu
reg add "HKCR\DesktopBackground\Shell\0Toggle" /v "SeparatorBefore" /t REG_SZ /d "" /f
reg add "HKCR\DesktopBackground\Shell\0Toggle" /v "SubCommands" /t REG_SZ /d "" /f
reg add "HKCR\DesktopBackground\Shell\0Toggle" /v "Icon" /t REG_SZ /d "c:\windows\system32\mmsys.cpl,-115" /f
reg add "HKCR\DesktopBackground\Shell\0Toggle" /v "MUIVerb" /t REG_SZ /d "Toggle Disable/Enable" /f
:: sub-menu
reg add "HKCR\DesktopBackground\Shell\0Toggle\shell\3Start" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64008" /f
reg add "HKCR\DesktopBackground\Shell\0Toggle\shell\3Start" /v "MUIVerb" /t REG_SZ /d "Disable Start-menu" /f
reg add "HKCR\DesktopBackground\Shell\0Toggle\shell\3Start\command" /ve /t REG_SZ /d "\"%~dp0toggle-on-off-win10-start-menu.bat\"" /f
pause
exit