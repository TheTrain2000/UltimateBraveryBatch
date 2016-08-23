@echo off
:programtop
if exist Resources/_Options.bat (
  goto :nextoptions
) else (
  echo %DATE% %TIME% _Options.bat is missing from the resources folder. >> errorlog.txt
  echo _Options.bat is missing from the resources folder.
  pause >nul
  exit
)
:nextoptions
call Resources/_Options.bat
call Resources/Translations/%lang%.bat
color %bgcolor%%fgcolor%
title %lang_ultimate_bravery%
if %offlinemode%==1 goto :mainmenu
:: goto :update

:mainmenu
color %bgcolor%%fgcolor%
title Ultimate Bravery
del "Resources\_curver.bat"
cls
echo Ultimate Bravery Batch - v%pversion%
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



:changeoptions
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %lang_options_menu_welcome%
echo %lang_options_be_prompted%
echo %lang_options_current_settings%
echo %lang_options_options_file%
echo.
echo %lang_options_press_no_change%
echo.
echo %lang_press_to_continue%
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
Resources\Libraries\fnr --cl --find "set bgcolor=%bgcolor%" --replace "set bgcolor=%bgcoloroptions%" --dir "%cd%\Resources" --fileMask "_Options.bat" --silent
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
Resources\Libraries\fnr --cl --find "set fgcolor=%fgcolor%" --replace "set fgcolor=%fgcoloroptions%" --dir "%cd%\Resources" --fileMask "_Options.bat" --silent
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
Resources\Libraries\fnr --cl --find "set forceupdate=%forceupdate%" --replace "set forceupdate=%forceupdateoptions%" --dir "%cd%\Resources" --fileMask "_Options.bat" --silent
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
Resources\Libraries\fnr --cl --find "set offlinemode=%offlinemode%" --replace "set offlinemode=%offlinemodeoptions%" --dir "%cd%\Resources" --fileMask "_Options.bat" --silent
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
Resources\Libraries\fnr --cl --find "set lang=%lang%" --replace "set lang=%languageoptions%" --dir "%cd%\Resources" --fileMask "_Options.bat" --silent
:changeoptionsnext5
cls
goto :programtop