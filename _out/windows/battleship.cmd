@cd /d %~dp0
@cd tincvpn
@start "battleship" cmd /c tinc-start battleship 660 200
@timeout /t 2
@start tinc-top cmd /c tinc-top
