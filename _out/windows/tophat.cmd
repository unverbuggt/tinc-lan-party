@cd /d %~dp0
@cd tincvpn
@start "tophat" cmd /c tinc-start tophat 663 203
@timeout /t 2
@start tinc-top cmd /c tinc-top
