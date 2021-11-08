@echo off
chcp 8555
color 70
title Внимание! Сведения могут быть не точными!
echo.
echo Биос
echo __________________________
For /F "tokens=2 Delims==" %%J In ('wmic bios get caption /Value^|FindStr .') Do echo Название: %%J
echo.
echo Операционная система
echo __________________________
if defined ProgramFiles(x86) (set oper=x64) else (set oper=x32)
FOR /F "tokens=1* delims==" %%A IN ('wmic os get caption /Format:List ^| FIND "="') DO set "s=%%~B"
echo Название: %s% %oper%
For /F "tokens=2 Delims==" %%J In ('wmic os get buildnumber /Value^|FindStr .') Do echo Номер сборки: %%J
For /F "tokens=2 Delims==" %%J In ('wmic os get systemdrive /Value^|FindStr .') Do echo Установлена на диске: %%J
wmic os get servicepackmajorversion | 1>nul findstr "0" && echo Сервис пак: Не установлен || (
For /F "tokens=2 Delims==" %%J In ('wmic os get servicepackmajorversion /Value^|FindStr .') Do echo Сервис пак: %%J
)
echo Пользователь: %username%
For /F "tokens=2 Delims==" %%J In ('wmic os get numberofusers /Value^|FindStr .') Do echo Количество пользователей: %%J
For /F "tokens=2 Delims==" %%J In ('wmic computersystem get domain /Value^|FindStr .') Do echo Рабочая группа: %%J
echo.
echo Материнская плата
echo __________________________
For /F "tokens=2 Delims==" %%J In ('WMIC baseboard get manufacturer /Value^|FindStr .') Do echo Название: %%J
For /F "tokens=2 Delims==" %%J In ('WMIC baseboard get product /Value^|FindStr .') Do echo Модель: %%J
echo.
echo Процессор
echo __________________________
For /F "tokens=2 Delims==" %%J In ('wmic computersystem get numberofprocessors /Value^|FindStr .') Do echo Количество процессоров: %%J
For /F "tokens=2 Delims==" %%J In ('WMIC CPU Get Name /Value^|FindStr .') Do echo Название: %%J
FOR /F "tokens=1* delims==" %%A IN ('WMIC CPU Get currentclockspeed /Format:List ^| FIND "="') DO set "s=%%~B"
echo Частота: %s% Мгц
FOR /F "tokens=1* delims==" %%A IN ('WMIC CPU Get maxclockspeed /Format:List ^| FIND "="') DO set "s=%%~B"
echo Максимальная частота: %s% Мгц
set cachelevel=2
set cachelevelrus=второго
call :cache
set cachelevel=3
set cachelevelrus=третьего
call :cache
goto 1
:cache
FOR /F "tokens=1* delims==" %%A IN ('WMIC CPU Get l%cachelevel%cachesize /Format:List ^| FIND "="') DO set "su=%%~B"
call :mbgb
if %su% GTR 1024 set /a su=%su%/1000
echo Кэш %cachelevelrus% уровня: %su% %uu%
exit /b
:1
FOR /F "tokens=1* delims==" %%A IN ('WMIC CPU Get numberofcores /Format:List ^| FIND "="') DO set "s=%%~B"
FOR /F "tokens=1* delims==" %%A IN ('WMIC CPU Get numberoflogicalprocessors /Format:List ^| FIND "="') DO set "ss=%%~B"
echo Ядер: %s% Потоков: %ss%
echo.
echo Видеокарта
echo __________________________
set /a numik=0
FOR /F "tokens=1* delims==" %%A IN ('WMIC Path Win32_VideoController get AdapterRAM /Format:List ^| FIND "="') DO set "s=%%~B" & call :vdo
goto 2
:vdo
set /a numik=%numik%+1
set /a sss=%s%/1024/1024
echo Видеопамять %numik%: %sss% Мб
exit /b
:2
set /a num=0
for /F "tokens=1* delims==" %%A IN ('WMIC Path Win32_VideoController get Name /Format:List ^| FIND "="') DO set "s=%%~B" & call :vdol
goto 3
:vdol
set /a num=%num%+1
echo Видеокарта %num%: %s%
exit /b
:3
for /F "tokens=2 delims==" %%A IN ('WMIC Path Win32_VideoController get currenthorizontalresolution /Format:List ^| FIND "="') DO call :hor "%%A"
:hor
if not "%~1"=="" set hh=%~1
for /F "tokens=2 delims==" %%A IN ('WMIC Path Win32_VideoController get currentverticalresolution /Format:List ^| FIND "="') DO call :ver "%%A"
:ver
if not "%~1"=="" set vv=%~1
echo Текущее разрешение: %hh% x %vv%
echo.
echo Звуковая карта
echo __________________________
set /a num=0
FOR /F "tokens=1* delims==" %%A IN ('WMIC sounddev get Name /Format:List ^| FIND "="') DO set "s=%%~B" & call :vdol
goto 3
:vdol
set /a num=%num%+1
echo Название устройства: %num%: %s%
exit /b
:3
echo.
echo Оперативная память
echo __________________________
set /a num=0
FOR /F "tokens=1* delims==" %%A IN ('WMIC memorychip get capacity /Format:List ^| FIND "="') DO set "s=%%~B" & call :vdols
goto 33
:vdols
set /a num=%num%+1
echo Слот памяти: %num%: %s% б
exit /b
:33
FOR /F "tokens=1* delims==" %%A IN ('WMIC os get totalvisiblememorysize /Format:List ^| FIND "="') DO set "su=%%~B" & call :vdod
goto 4
:vdod
call :mbgb
goto after
:mbgb
if %su% LSS 1 (set uu=б) else if %su% LSS 1024 (set uu=Кб) else if %su% GTR 1024 set uu=Мб
exit /b
:after
set /a sss=%su%/1024
echo Доступно: %sss% %uu%
exit /b
:4
for /F "tokens=2 Delims==" %%J In ('WMIC memphysical get memorydevices /Value^|FindStr .') Do echo Слотов для памяти: %%J
echo.
echo Переносные устройства
echo __________________________
For /F "tokens=2 Delims==" %%J In ('WMIC cdrom get id /Value^|FindStr .') Do echo Диск: %%J
For /F "tokens=2 Delims==" %%J In ('WMIC cdrom get volumename /Value^|FindStr .') Do echo Название: %%J
pause