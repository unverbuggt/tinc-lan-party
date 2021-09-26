@cd /d %~dp0
@cd tincvpn
@start "boot" cmd /c tinc-start boot 662 202
@timeout /t 2
@start tinc-top cmd /c tinc-top
