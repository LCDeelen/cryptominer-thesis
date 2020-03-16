echo This script has been disabled and will exit
pause
exit

cls
@echo off

set ip=10.0.0.2
set user=Client
set pass=CorrectHorseBatteryStaple

echo Wait three minutes for system to load
timeout 180

:getlist_1
timeout 1
echo Retreiving file list...
echo open %ip%> ftpscript.txt
echo %user%>> ftpscript.txt
echo %pass%>> ftpscript.txt
echo ls * files.txt>> ftpscript.txt
echo quit>> ftpscript.txt
ftp -s:ftpscript.txt > error.log

find "Transfer complete" error.log
goto getlist_%errrolevel%
:getlist_0

:getsample_1
timeout 1
echo Retreiving sample...
set /p filename=< files.txt
echo open %ip%> ftpscript.txt
echo %user%>> ftpscript.txt
echo %pass%>> ftpscript.txt
echo get "%filename%" "C:\Users\Client\Downloads\%filename%">> ftpscript.txt
echo delete "%filename%">> ftpscript.txt
echo quit>> ftpscript.txt
ftp -s:ftpscript.txt > error.log

find "Transfer complete" error.log
goto getsample_%errrolevel%
:getsample_0

echo Extracting sample...
7z e "C:\Users\Client\Downloads\%filename%" -oC:\Users\Client\Downloads\ -pinfected -y
del "C:\Users\Client\Downloads\%filename%"
dir C:\Users\Client\Downloads\ /b > files.txt
set /p filename=< files.txt
move "C:\Users\Client\Downloads\%filename%" "C:\Users\Client\Downloads\%filename%.exe"

echo Cleaning scripts...
del ftpscript.txt files.txt error.log

echo Rename and run the sample...
start /D "C:\Users\Client\Downloads\" %filename%.exe


echo Plan forced shutdown in 10 minutes...
shutdown -s -f -t 610

echo Run the sample and remove script...
goto 2> nul & del "%~f0" & start C:\Users\Client\Downloads\%filename%.exe & timeout 610