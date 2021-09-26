@ECHO OFF
echo ----------------------------------------------------------------------
echo %1 - Port: %2 - IP: 192.168.235.%3
echo ----------------------------------------------------------------------
netsh interface ipv4 set address name="TAP1" static 192.168.235.%3 255.255.255.0 192.168.235.1
tincd -c . -o "Name=%1" -o "Ed25519PrivateKeyFile=keys\%1.key" -o "BindToAddress=* %2" -D
pause