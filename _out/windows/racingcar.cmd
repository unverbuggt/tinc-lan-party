@cd /d %~dp0
@cd tincvpn
@start "racingcar" cmd /c tinc-start racingcar 656 101
@timeout /t 2
@start tinc-top cmd /c tinc-top
