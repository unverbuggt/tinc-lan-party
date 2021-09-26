@cd /d %~dp0
@cd tincvpn
@start "scottiedog" cmd /c tinc-start scottiedog 659 104
@timeout /t 2
@start tinc-top cmd /c tinc-top
