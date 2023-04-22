@echo off
setlocal ENABLEDELAYEDEXPANSION

path %cd%

:input
set /p "text=Input max 10 chars: "
cd %path%\TempAudioFiles
del *.mp3
cd %path%\AudioFiles

set i=0
:toArr

set arr[%i%]=!text:~%i%,1!
if not [!arr[%i%]!]==[] (
copy /b !arr[%i%]!.mp3 %path%\TempAudioFiles\%i%.mp3
)

set /a i+=1
if not %i%==10 (goto toArr)

cd %path%\TempAudioFiles
copy /b *.mp3 result.mp3
start /wait result.mp3
echo "closed"

pause
cls
goto input