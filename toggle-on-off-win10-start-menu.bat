@echo off & cd /d "%~dp0"
fsutil dirty query %systemdrive% >nul && goto :GA || nsudo -U:E -P:E -UseCurrentConsole "%~0" %* && exit /b
:GA
cd /d "C:\Windows\SystemApps"
if exist "Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy" (goto Disable) else (goto Enable)
:Disable
TASKKILL /F /IM StartMenuExperienceHost.exe /T
ren "Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy" "++Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy" || goto Disable
reg add "HKCR\DesktopBackground\Shell\0Toggle\shell\3Start" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64007" /f
reg add "HKCR\DesktopBackground\Shell\0Toggle\shell\3Start" /v "MUIVerb" /t REG_SZ /d "Enable Start-menu" /f
exit
:Enable
ren "++Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy" "Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
reg add "HKCR\DesktopBackground\Shell\0Toggle\shell\3Start" /v "icon" /t REG_SZ /d "c:\windows\SystemResources\compstui.dll.mun,-64008" /f
reg add "HKCR\DesktopBackground\Shell\0Toggle\shell\3Start" /v "MUIVerb" /t REG_SZ /d "Disable Start-menu" /f
exit