REM This configures w32tm on Windows Server DC
REM Only run on FSMO master
REM Remember Firewall ports
REM Preuss 1/23/2013

REM This clears old settings
net stop w32time
w32tm /unregister
w32tm /register
net start w32time

REM Configure ntp server
net stop w32time
W32tm /config /syncfromflags:manual /manualpeerlist:"time.mait.minnesota.edu time2.mait.minnesota.edu time3.mait.minnesota.edu"
w32tm /config /reliable:yes
net start w32time
w32tm /query /configuration /verbose
pause
w32tm /config /update
w32tm /resync
pause
