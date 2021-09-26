@cd /d %~dp0
@cd tincvpn
@start "cat" cmd /c tinc-start cat 657 102
@timeout /t 2
@start tinc-top cmd /c tinc-top
