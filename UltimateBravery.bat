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
color %bgcolor%%fgcolor%
title Ultimate Bravery
if %offlinemode%==1 goto :mainmenu
goto :update

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
echo.
echo.
echo.
echo.
echo 1.) Summoner's Rift
echo 2.) Howling Abyss
echo 3.) Twisted Treeline
echo 4.) Custom Champion
echo 5.) Settings
echo 6.) Exit
CHOICE /C 123456 /M "Select an option."
IF ERRORLEVEL 6 exit
IF ERRORLEVEL 5 (
goto :settingsmenu
)
IF ERRORLEVEL 4 (
set customchampionenabled=1
goto :CustomChampionMenu
)
IF ERRORLEVEL 3 (
set map=TT
set displaymap=Twisted Treeline
goto :UltimateBravery
)
IF ERRORLEVEL 2 (
set map=ARAM
set displaymap=Howling Abyss
goto :UltimateBravery
)
IF ERRORLEVEL 1 (
set map=SR
set displaymap=Summoner's Rift
goto :UltimateBravery
)

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
echo Force update detected.
) else echo There is an update available. (v%curver%, patch %curpatch%)
echo Press any key to begin the download...
pause >NUL
Resources\Libraries\wget -O "%cd%\UltimateBravery.zip" "%ubmainurl%"
Resources\Libraries\7za x "%cd%\UltimateBravery.zip" -y -o"%cd%"
del "%cd%\UltimateBravery.zip"
del "Resources\_curver.bat"
echo.
echo.
echo.
echo Update complete.
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
set /p disablesmiteoptions="Disable Smite (def. 0): "
if [%languageoptions%] == [] goto :changeoptionsnext5
Resources\Libraries\fnr --cl --find "set disablesmite=%disablesmite%" --replace "set disablesmite=%disablesmiteoptions%" --dir "%cd%\Resources" --fileMask "_Settings.bat" --silent
:changeoptionsnext5
cls
goto :programtop

:: ---------- Custom Champion Menu

:CustomChampionMenu
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
set /p Champion="Enter a Champion: "
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
echo 1.) Summoner's Rift
echo 2.) Howling Abyss
echo 3.) Twisted Treeline
echo 4.) Change Champion
echo 5.) Exit
CHOICE /C 12345 /M "Select an option."
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 (
goto :CustomChampionMenu
)
IF ERRORLEVEL 3 (
set map==TT
set displaymap=Twisted Treeline
goto :UltimateBravery
)
IF ERRORLEVEL 2 (
set map=ARAM
set displaymap=Howling Abyss
goto :UltimateBravery
)
IF ERRORLEVEL 1 (
set map=SR
set displaymap=Summoner's Rift
goto :UltimateBravery
)

:: ---------- Functions

:ChampGeneration

if "%customchampionenabled%"=="1" (
	echo %Champion%
	echo %Champion% >> lastbuild.txt
	goto:eof
)

set /a LSkip=%RANDOM% %% %champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
set Champion=%%a
goto :exitchampgeneration
)
:exitchampgeneration
echo %Champion%
echo %Champion% >> lastbuild.txt
goto:eof



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
echo %SRItem% >> lastbuild.txt
goto:eof



:TTItemGeneration
set /a LSkip=%RANDOM% %% %ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
set TTItem=%%a
goto :exitttitemgeneration
)
:exitttitemgeneration

call:ItemChecker

if "!redo!"=="true" goto :TTItemGeneration
echo %TTItem%
echo %TTItem% >> lastbuild.txt
goto:eof



:ARAMItemGeneration
set /a LSkip=%RANDOM% %% %aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
set ARAMItem=%%a
goto :exitaramitemgeneration
)
:exitaramitemgeneration

call:ItemChecker

if "!redo!"=="true" goto :ARAMItemGeneration
echo %ARAMItem%
echo %ARAMItem% >> lastbuild.txt
goto:eof



:AdjGeneration
set /a LSkip=%RANDOM% %% %adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
set Adjective=%%a
goto :exitadjgeneration
)
:exitadjgeneration

echo %Adjective%
echo %Adjective% >> lastbuild.txt
goto:eof



:BootsGeneration
set /a LSkip=%RANDOM% %% %bootscount%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
set Boots=%%a
goto :exitbootgeneration
)
:exitbootgeneration

if "%Champion%"=="Cassiopeia" (
	call:%map%ItemGeneration
	goto:eof
)

echo %Boots%
echo %Boots% >> lastbuild.txt
goto:eof



:MasteryGeneration
set /a LSkip=%RANDOM% %% %masterycount%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
set Masteries=%%a
goto :exitmasterygeneration
)
:exitmasterygeneration

echo %Masteries%
echo %Masteries% >> lastbuild.txt
goto:eof



:MaxGeneration
set /a LSkip=%RANDOM% %% %maxcount%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
set Max=%%a
goto :exitmaxgeneration
)
:exitmaxgeneration

echo %Max%
echo %Max% >> lastbuild.txt
goto:eof



:SpellGeneration
set /a LSkip=%RANDOM% %% %summonerscount%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners.txt) do (
set Spell1=%%a
goto :exitspellgeneration
)
:exitspellgeneration

set /a LSkip=%RANDOM% %% %summonerscount%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners.txt) do (
set Spell2=%%a
goto :exitspellgeneration2
)
:exitspellgeneration2

set redo=false
if "!Spell1!"=="!Spell2!" set redo=true
if "%map%"=="ARAM" (
	if "!Spell1!"=="TELEPORT" set redo=true
	if "!Spell2!"=="TELEPORT" set redo=true
	if "!Spell1!"=="SMITE" set redo=true
	if "!Spell2!"=="SMITE" set redo=true
)
if "%map%"=="SR" (
	if "!Spell1!"=="CLARITY" set redo=true
	if "!Spell2!"=="CLARITY" set redo=true
	if "!Spell1!"=="MARK" set redo=true
	if "!Spell2!"=="MARK" set redo=true
)
if "%map%"=="TT" (
	if "!Spell1!"=="CLARITY" set redo=true
	if "!Spell2!"=="CLARITY" set redo=true
	if "!Spell1!"=="MARK" set redo=true
	if "!Spell2!"=="MARK" set redo=true
)
if "%disablesmite%"=="1" (
	if "!Spell1!"=="SMITE" set redo=true
	if "!Spell2!"=="SMITE" set redo=true
)

if "!redo!"=="true" goto :SpellGeneration

echo %Spell1%
echo %Spell2%
echo %Spell1% >> lastbuild.txt
echo %Spell2% >> lastbuild.txt
goto:eof



:TrinketGeneration

if "%map%"=="ARAM" goto:eof
if "%map%"=="TT" goto:eof

set /a LSkip=%RANDOM% %% %trinketcount%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
set Trinket=%%a
goto :exittrinketgeneration
)
:exittrinketgeneration

echo %Trinket%
echo %Trinket% >> lastbuild.txt
goto:eof


:ItemChecker
set redo=false
if "!%Champion%[1]!"=="ranged" (
	set result=F
	if "!%map%Item!"=="Ravenous Hydra" set result=T
	if "!%map%Item!"=="Titanic Hydra" set result=T
	if "!result!"=="T" (
		set redo=true
	)
)

if "!%Champion%[1]!"=="melee" (
	set result=F
	if "!%map%Item!"=="Runaan's Hurricane" set result=T
	if "!result!"=="T" (
		set redo=true
	)
)

if "!%Champion%[1]!"=="none" (
	set result=F
	if "!%map%Item!"=="Runaan's Hurricane" set result=T
	if "!%map%Item!"=="Ravenous Hydra" set result=T
	if "!%map%Item!"=="Titanic Hydra" set result=T
	if "!result!"=="T" (
		set redo=true
	)
)

goto:eof

:: ---------- Ultimate Bravery Format

:UltimateBravery
cls
echo                                 Ultimate Bravery
echo                                 by: TheTrain2000
echo                                Current Patch: %patch%
echo                                Map: %displaymap%
echo --------------------------------------------------------------------------------
echo                                 Ultimate Bravery > lastbuild.txt
echo                                 by: TheTrain2000 >> lastbuild.txt
echo                                Current Patch: %patch% >> lastbuild.txt
echo                                Map: %displaymap% >> lastbuild.txt
echo -------------------------------------------------------------------------------- >> lastbuild.txt
call:AdjGeneration
call:ChampGeneration
call:MaxGeneration
echo.
echo. >> lastbuild.txt
call:SpellGeneration
echo.
echo. >> lastbuild.txt
call:BootsGeneration
call:%map%ItemGeneration
call:%map%ItemGeneration
call:%map%ItemGeneration
call:%map%ItemGeneration
call:%map%ItemGeneration
echo.
echo. >> lastbuild.txt
call:MasteryGeneration
call:TrinketGeneration
echo.
echo. >> lastbuild.txt
echo Press any key to reroll...
pause >NUL
goto :UltimateBravery