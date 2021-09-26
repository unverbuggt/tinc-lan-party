@cd /d %~dp0
@cd tincvpn
@start "thimble" cmd /c tinc-start thimble 658 103
@timeout /t 2
@start tinc-top cmd /c tinc-top
