@echo off
:programtop
setlocal EnableDelayedExpansion
if exist Resources/_Settings.bat (
  goto :nextsettings
) else (
  echo %DATE% %TIME% _Settings.bat is missing from the resources folder. >> errorlog.txt
  echo _Settings.bat is missing from the resources folder.
  pause >nul
  exit
)
:nextsettings

:: ---------- Initialization

call Resources/_Settings.bat
call Resources/_ChampionVariables.bat
call Resources/Translations/%lang%.bat
color %bgcolor%%fgcolor%
title %lang_ultimate_bravery%
if %offlinemode%==1 goto :mainmenu
:: goto :update

:: ---------- Main Menu

:mainmenu
color %bgcolor%%fgcolor%
title Ultimate Bravery
del "Resources\_curver.bat"
cls
echo Ultimate Bravery Batch - v%pversion%, patch %patch%
echo.
echo.
echo.
echo.
goto :test
echo.
echo.
echo.
echo.
echo 1.) Summoner's Rift
echo 2.) Howling Abyss
echo 3.) Twisted Treeline
echo 4.) Custom Champion
echo 5.) Team Bravery
echo 6.) Settings
echo 7.) Exit
CHOICE /C 1234567 /M "Select an option."
IF ERRORLEVEL 7 exit
IF ERRORLEVEL 6 goto :settingsmenu
IF ERRORLEVEL 5 goto :teambraverymenu
IF ERRORLEVEL 4 goto :customchamp
IF ERRORLEVEL 3 goto :TTbravery
IF ERRORLEVEL 2 goto :ARAMbravery
IF ERRORLEVEL 1 goto :SRbravery

:: ---------- Update Function

:update
cls
if %forceupdate%==1 goto :forceupdate
Resources\Libraries\wget -O Resources\_curver.bat "%vcheckurl%"
for %%a in (Resources\_curver.bat) do (
set curverlength=%%~za
)
if %curverlength% equ 0 goto :failedupdatecheck
call Resources\_curver.bat
if "%pversion%" neq "%curver%" set result=true
if "%patch%" neq "%curpatch%" set result=true
if "%result%" == "true" (
   	goto :nextupdate
)
goto :mainmenu
:nextupdate
:forceupdate
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if %forceupdate%==1 (
echo %lang_update_force_detect%
) else echo %lang_update_available% (v%curver%, patch %curpatch%)
echo %lang_update_being%
pause >NUL
Resources\Libraries\wget -O "%cd%\UltimateBravery.zip" "%ubmainurl%"
Resources\Libraries\7za x "%cd%\UltimateBravery.zip" -y -o"%cd%"
del "%cd%\UltimateBravery.zip"
del "Resources\_curver.bat"
echo.
echo.
echo.
echo %lang_update_complete%
pause >NUL
exit

:: ---------- Update Check Failed

:failedupdatecheck
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Update check failed.
echo Press any key to return
echo to the main menu.
pause >NUL
goto :mainmenu

:: ---------- Change Settings

:settingsmenu
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Welcome to the settings menu!
echo You will be prompted to change
echo you current settings.
echo.
echo Press enter for no change.
echo.
echo Press any key to continue...
pause >NUL
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p bgcoloroptions="Background Color (def. 0): "
if [%bgcoloroptions%] == [] goto :changeoptionsnext
Resources\Libraries\fnr --cl --find "set bgcolor=%bgcolor%" --replace "set bgcolor=%bgcoloroptions%" --dir "%cd%\Resources" --fileMask "_Settings.bat" --silent
:changeoptionsnext
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p fgcoloroptions="Foreground Color (def. F): "
if [%fgcoloroptions%] == [] goto :changeoptionsnext2
Resources\Libraries\fnr --cl --find "set fgcolor=%fgcolor%" --replace "set fgcolor=%fgcoloroptions%" --dir "%cd%\Resources" --fileMask "_Settings.bat" --silent
:changeoptionsnext2
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p forceupdateoptions="Force Update (def. 0): "
if [%forceupdateoptions%] == [] goto :changeoptionsnext3
Resources\Libraries\fnr --cl --find "set forceupdate=%forceupdate%" --replace "set forceupdate=%forceupdateoptions%" --dir "%cd%\Resources" --fileMask "_Settings.bat" --silent
:changeoptionsnext3
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p offlinemodeoptions="Offline Mode (def. 0): "
if [%offlinemodeoptions%] == [] goto :changeoptionsnext4
Resources\Libraries\fnr --cl --find "set offlinemode=%offlinemode%" --replace "set offlinemode=%offlinemodeoptions%" --dir "%cd%\Resources" --fileMask "_Settings.bat" --silent
:changeoptionsnext4
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p languageoptions="Language (def. EN_US): "
if [%languageoptions%] == [] goto :changeoptionsnext5
Resources\Libraries\fnr --cl --find "set lang=%lang%" --replace "set lang=%languageoptions%" --dir "%cd%\Resources" --fileMask "_Settings.bat" --silent
:changeoptionsnext5
cls
goto :programtop

:: ---------- Generation Functions

:SRItemGeneration
set /a LSkip=%RANDOM% %% %sritems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/SR/Items.txt) do (
set SRItem=%%a
goto :exitsritemgeneration
)
:exitsritemgeneration

call:ItemChecker

if "!redo!"=="true" goto :SRItemGeneration
echo %SRItem%
goto:eof

:TTItemGeneration
goto:eof

:ARAMItemGeneration
goto:eof

:ChampGeneration
set /a LSkip=%RANDOM% %% %champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
set Champion=%%a
goto :exitchampgeneration
)
:exitchampgeneration
echo %Champion%
goto:eof


:AdjGeneration
goto:eof


:BootsGeneration
goto:eof


:MasteryGeneration
goto:eof


:MaxGeneration
goto:eof


:SpellGeneration
goto:eof


:TrinketGeneration
goto:eof


:ItemChecker
set redo=false
if "!%Champion%[1]!"=="ranged" (
	set result=F
	if "%SRItem%"=="Ravenous Hydra" set result=T
	if "%SRItem%"=="Titanic Hydra" set result=T
	if "!result!"=="T" (
		set redo=true
	)
)

if "!%Champion%[1]!"=="melee" (
	set result=F
	if "%SRItem%"=="Runaan's Hurricane" set result=T
	if "!result!"=="T" (
		set redo=true
	)
)

if "!%Champion%[1]!"=="none" (
	set result=F
	if "%SRItem%"=="Runaan's Hurricane" set result=T
	if "%SRItem%"=="Ravenous Hydra" set result=T
	if "%SRItem%"=="Titanic Hydra" set result=T
	if "!result!"=="T" (
		set redo=true
	)
)

goto:eof

:test
cls
call:ChampGeneration

:redoitem
call:SRItemGeneration
call:SRItemGeneration
call:SRItemGeneration
call:SRItemGeneration
call:SRItemGeneration
call:SRItemGeneration
call:SRItemGeneration
call:SRItemGeneration

echo !%Champion%[1]!
pause
goto :test