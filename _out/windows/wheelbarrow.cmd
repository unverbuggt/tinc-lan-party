@cd /d %~dp0
@cd tincvpn
@start "wheelbarrow" cmd /c tinc-start wheelbarrow 661 201
@timeout /t 2
@start tinc-top cmd /c tinc-top
