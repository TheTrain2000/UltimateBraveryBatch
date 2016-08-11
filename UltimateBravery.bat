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
goto :update

:mainmenu
color %bgcolor%%fgcolor%
title %lang_ultimate_bravery%
del "Resources\_curver.bat"
cls
echo %lang_ultimate_bravery% Batch - v%pversion%
echo.
echo.
echo Thanks to all who report bugs.
echo You are all a great help in this
echo project. :)
echo.
echo.
echo.
echo 1.) %lang_summoners_rift%
echo 2.) %lang_howling_abyss%
echo 3.) %lang_twisted_treeline%
echo 4.) %lang_custom_champion%
echo 5.) %lang_team_bravery%
echo 6.) %lang_options_menu%
echo 7.) %lang_exit%
CHOICE /C 1234567 /M "Select an option."
IF ERRORLEVEL 7 exit
IF ERRORLEVEL 6 goto :changeoptions
IF ERRORLEVEL 5 goto :teambraverymenu
IF ERRORLEVEL 4 goto :customchamp
IF ERRORLEVEL 3 goto :TT
IF ERRORLEVEL 2 goto :ARAM
IF ERRORLEVEL 1 goto :SR
:SR
if exist Resources/Champs.txt (
  goto :next
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:next
if exist Resources/Items.txt (
  goto :next2
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_gen% >> errorlog.txt
  echo Items.txt %lang_missing_gen%
  pause >nul
  exit
)
:next2
if exist Resources/Adjectives.txt (
  goto :next3
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:next3
if exist Resources/Boots.txt (
  goto :next4
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:next4
if exist Resources/Max.txt (
  goto :next5
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:next5
if exist Resources/Summoners1.txt (
  goto :next6
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_gen% >> errorlog.txt
  echo Summoners1.txt %lang_missing_gen%
  pause >nul
  exit
)
:next6
if exist Resources/Summoners2.txt (
  goto :next7
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_gen% >> errorlog.txt
  echo Summoners2.txt %lang_missing_gen%
  pause >nul
  exit
)
:next7
if exist Resources/Masteries.txt (
  goto :next8
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:next8
if exist Resources/Trinket.txt (
  goto :next9
) else (
  echo %DATE% %TIME% Trinket.txt %lang_missing_gen% >> errorlog.txt
  echo Trinket.txt %lang_missing_gen%
  pause >nul
  exit
)
:next9
:top
set enableboots=1
break>lastbuild.txt
cls
echo                                 %lang_ultimate_bravery%
echo                                 %lang_ultimate_bravery% >> lastbuild.txt
echo                                 by TheTrain2000 
echo                                 by TheTrain2000 >> lastbuild.txt
echo                                %lang_current_patch% %patch%
echo                                %lang_current_patch% %patch% >> lastbuild.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> lastbuild.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show10
)
:show10
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> lastbuild.txt
echo %%a
if %%a==%cass% set enableboots=0
goto show
)
:show
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show9
)
:show9
echo. >> lastbuild.txt
echo. 
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show1
)
:show1
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show2
)
:show2
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM% %% %boots%+1
if %enableboots%==1 (


for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show8
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (


for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show8
)
)
:show8

SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show3
)
:show3
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show4
)
:show4
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show5
)
:show5
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show6
)
:show6
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show7
)
:show7
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show11
)
:show11
SET /A LSkip=%RANDOM%%%%trinket%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show12
)
:show12
echo. >> lastbuild.txt
echo.
echo %lang_reroll%
pause >NUL
goto :top







:ARAM
if exist Resources/Champs.txt (
  goto :aramnext
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:aramnext
if exist Resources/ARAM/Items.txt (
  goto :aramnext2
) else (
  echo %DATE% %TIME% ARAMItems.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMItems.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext2
if exist Resources/Adjectives.txt (
  goto :aramnext3
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext3
if exist Resources/Boots.txt (
  goto :aramnext4
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext4
if exist Resources/Max.txt (
  goto :aramnext5
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext5
if exist Resources/ARAM/Summoners1.txt (
  goto :aramnext6
) else (
  echo %DATE% %TIME% ARAMSummoners1.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMSummoners1.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext6
if exist Resources/ARAM/Summoners2.txt (
  goto :aramnext7
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMSummoners2.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext7
if exist Resources/Masteries.txt (
  goto :aramnext8
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext8
:top2
set enableboots=1
break>lastbuild.txt
cls
echo                                 %lang_ultimate_bravery%
echo                                 %lang_ultimate_bravery% >> lastbuild.txt
echo                                 by TheTrain2000 
echo                                 by TheTrain2000 >> lastbuild.txt
echo                                %lang_current_patch% %patch%
echo                                %lang_current_patch% %patch% >> lastbuild.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------- >> lastbuild.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow10
)
:aramshow10
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> lastbuild.txt
echo %%a
if %%a==%cass% set enableboots=0
goto aramshow
)
:aramshow
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow9
)
:aramshow9
echo. >> lastbuild.txt
echo. 
SET /A LSkip=%RANDOM%%%%aramsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners2.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow1
)
:aramshow1
SET /A LSkip=%RANDOM%%%%aramsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners1.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow2
)
:aramshow2
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow8
)
)
SET /A LSkip=%RANDOM%%%%aramitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow8
)
)
:aramshow8

SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow3
)
:aramshow3
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow4
)
:aramshow4
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow5
)
:aramshow5
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow6
)
:aramshow6
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow7
)
:aramshow7
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow11
)
:aramshow11
echo. >> lastbuild.txt
echo.
echo %lang_reroll%
pause >NUL
goto :top2




:customchamp
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
echo.
set /p customchamp="%lang_custom_champ_name% "
goto :custommenu

:custommenu
cls
echo %lang_ultimate_bravery% Batch - v%pversion%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 1.) %lang_summoners_rift%
echo 2.) %lang_howling_abyss%
echo 3.) %lang_twisted_treeline%
echo 4.) %lang_change_champion%
echo 5.) %lang_exit%
CHOICE /C 123456 /M "Select an option."
IF ERRORLEVEL 5 exit
IF ERRORLEVEL 4 goto :customchamp
IF ERRORLEVEL 3 goto :TTcustom
IF ERRORLEVEL 2 goto :ARAMcustom
IF ERRORLEVEL 1 goto :SRcustom
:SRcustom
if exist Resources/Champs.txt (
  goto :nextcustom
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:nextcustom
if exist Resources/Items.txt (
  goto :next2custom
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_gen% >> errorlog.txt
  echo Items.txt %lang_missing_gen%
  pause >nul
  exit
)
:next2custom
if exist Resources/Adjectives.txt (
  goto :next3custom
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:next3custom
if exist Resources/Boots.txt (
  goto :next4custom
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:next4custom
if exist Resources/Max.txt (
  goto :next5custom
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:next5custom
if exist Resources/Summoners1.txt (
  goto :next6custom
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_gen% >> errorlog.txt
  echo Summoners1.txt %lang_missing_gen%
  pause >nul
  exit
)
:next6custom
if exist Resources/Summoners2.txt (
  goto :next7custom
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_gen% >> errorlog.txt
  echo Summoners2.txt %lang_missing_gen%
  pause >nul
  exit
)
:next7custom
if exist Resources/Masteries.txt (
  goto :next8custom
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:next8custom
if exist Resources/Trinket.txt (
  goto :next9custom
) else (
  echo %DATE% %TIME% Trinket.txt %lang_missing_gen% >> errorlog.txt
  echo Trinket.txt %lang_missing_gen%
  pause >nul
  exit
)
:next9custom
:topcustom
set enableboots=1
break>lastbuild.txt
cls
echo                                 %lang_ultimate_bravery%
echo                                 %lang_ultimate_bravery% >> lastbuild.txt
echo                                 by TheTrain2000 
echo                                 by TheTrain2000 >> lastbuild.txt
echo                                %lang_current_patch% %patch%
echo                                %lang_current_patch% %patch% >> lastbuild.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> lastbuild.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show10custom
)
:show10custom

echo %customchamp% >> lastbuild.txt
echo %customchamp%
if %customchamp%==%cass% set enableboots=0
goto showcustom
)
:showcustom
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show9custom
)
:show9custom
echo. >> lastbuild.txt
echo. 
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show1custom
)
:show1custom
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show2custom
)
:show2custom
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show8custom
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show8custom
)
)
:show8custom
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show3custom
)
:show3custom
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show4custom
)
:show4custom
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show5custom
)
:show5custom
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show6custom
)
:show6custom
SET /A LSkip=%RANDOM%%%%items%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show7custom
)
:show7custom
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show11custom
)
:show11custom
SET /A LSkip=%RANDOM%%%%trinket%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto show12custom
)
:show12custom
echo. >> lastbuild.txt
echo.
echo %lang_reroll%
pause >NUL
goto :topcustom







:ARAMcustom
if exist Resources/Champs.txt (
  goto :aramnextcustom
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:aramnextcustom
if exist Resources/ARAM/Items.txt (
  goto :aramnext2custom
) else (
  echo %DATE% %TIME% ARAMItems.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMItems.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext2custom
if exist Resources/Adjectives.txt (
  goto :aramnext3custom
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext3custom
if exist Resources/Boots.txt (
  goto :aramnext4custom
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext4custom
if exist Resources/Max.txt (
  goto :aramnext5custom
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext5custom
if exist Resources/ARAM/Summoners1.txt (
  goto :aramnext6custom
) else (
  echo %DATE% %TIME% ARAMSummoners1.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMSummoners1.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext6custom
if exist Resources/ARAM/Summoners2.txt (
  goto :aramnext7custom
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMSummoners2.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext7custom
if exist Resources/Masteries.txt (
  goto :aramnext8custom
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext8custom
:top2custom
set enableboots=1
break>lastbuild.txt
cls
echo                                 %lang_ultimate_bravery%
echo                                 %lang_ultimate_bravery% >> lastbuild.txt
echo                                 by TheTrain2000 
echo                                 by TheTrain2000 >> lastbuild.txt
echo                                %lang_current_patch% %patch%
echo                                %lang_current_patch% %patch% >> lastbuild.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------- >> lastbuild.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow10custom
)
:aramshow10custom

echo %customchamp% >> lastbuild.txt
echo %customchamp%
if %customchamp%==%cass% set enableboots=0
goto aramshowcustom
)
:aramshowcustom
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow9custom
)
:aramshow9custom
echo. >> lastbuild.txt
echo. 
SET /A LSkip=%RANDOM%%%%aramsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners2.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow1custom
)
:aramshow1custom
SET /A LSkip=%RANDOM%%%%aramsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners1.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow2custom
)
:aramshow2custom
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow8custom
)
)
SET /A LSkip=%RANDOM%%%%aramitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow8custom
)
)
:aramshow8custom
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow3custom
)
:aramshow3custom
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow4custom
)
:aramshow4custom
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow5custom
)
:aramshow5custom
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow6custom
)
:aramshow6custom
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow7custom
)
:aramshow7custom
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto aramshow11custom
)
:aramshow11custom
echo. >> lastbuild.txt
echo.
echo %lang_reroll%
pause >NUL
goto :top2custom



:TT
if exist Resources/Champs.txt (
  goto :ttnext
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:ttnext
if exist Resources/TT/Items.txt (
  goto :ttnext2
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_tt% >> errorlog.txt
  echo Items.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext2
if exist Resources/Adjectives.txt (
  goto :ttnext3
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext3
if exist Resources/Boots.txt (
  goto :ttnext4
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext4
if exist Resources/Max.txt (
  goto :ttnext5
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext5
if exist Resources/TT/Summoners1.txt (
  goto :ttnext6
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners1.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext6
if exist Resources/TT/Summoners2.txt (
  goto :ttnext7
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners2.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext7
if exist Resources/Masteries.txt (
  goto :ttnext8
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext8
:tttop
set enableboots=1
break>lastbuild.txt
cls
echo                                 %lang_ultimate_bravery%
echo                                 %lang_ultimate_bravery% >> lastbuild.txt
echo                                 by TheTrain2000 
echo                                 by TheTrain2000 >> lastbuild.txt
echo                                %lang_current_patch% %patch%
echo                                %lang_current_patch% %patch% >> lastbuild.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> lastbuild.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%-----------------------------
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow10
)
:ttshow10
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> lastbuild.txt
echo %%a
if %%a==%cass% set enableboots=0
goto ttshow
)
:ttshow
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow9
)
:ttshow9
echo. >> lastbuild.txt
echo. 
SET /A LSkip=%RANDOM%%%%ttsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners2.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow1
)
:ttshow1
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow2
)
:ttshow2
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow8
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow8
)
)
:ttshow8
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow3
)
:ttshow3
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow4
)
:ttshow4
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow5
)
:ttshow5
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow6
)
:ttshow6
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow7
)
:ttshow7
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow11
)
:ttshow11
echo. >> lastbuild.txt
echo.
echo %lang_reroll%
pause >NUL
goto :tttop






:TTcustom
if exist Resources/Champs.txt (
  goto :ttnextcustom
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:ttnextcustom
if exist Resources/TT/Items.txt (
  goto :ttnext2custom
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_tt% >> errorlog.txt
  echo Items.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext2custom
if exist Resources/Adjectives.txt (
  goto :ttnext3custom
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext3custom
if exist Resources/Boots.txt (
  goto :ttnext4custom
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext4custom
if exist Resources/Max.txt (
  goto :ttnext5custom
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext5custom
if exist Resources/TT/Summoners1.txt (
  goto :ttnext6custom
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners1.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext6custom
if exist Resources/TT/Summoners2.txt (
  goto :ttnext7custom
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners2.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext7custom
if exist Resources/Masteries.txt (
  goto :ttnext8custom
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext8custom
:tttopcustom
set enableboots=1
break>lastbuild.txt
cls
echo                                 %lang_ultimate_bravery%
echo                                 %lang_ultimate_bravery% >> lastbuild.txt
echo                                 by TheTrain2000 
echo                                 by TheTrain2000 >> lastbuild.txt
echo                                %lang_current_patch% %patch%
echo                                %lang_current_patch% %patch% >> lastbuild.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> lastbuild.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%-----------------------------
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow10custom
)
:ttshow10custom

echo %customchamp% >> lastbuild.txt
echo %customchamp%
if %customchamp%==%cass% set enableboots=0
goto ttshowcustom
)
:ttshowcustom
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow9custom
)
:ttshow9custom
echo. >> lastbuild.txt
echo. 
SET /A LSkip=%RANDOM%%%%ttsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners2.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow1custom
)
:ttshow1custom
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow2custom
)
:ttshow2custom
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow8custom
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow8custom
)
)
:ttshow8custom
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow3custom
)
:ttshow3custom
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow4custom
)
:ttshow4custom
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow5custom
)
:ttshow5custom
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow6custom
)
:ttshow6custom
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow7custom
)
:ttshow7custom
echo. >> lastbuild.txt
echo.
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> lastbuild.txt
echo %%a
goto ttshow11custom
)
:ttshow11custom
echo. >> lastbuild.txt
echo.
echo %lang_reroll%
pause >NUL
goto :tttopcustom



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


:teambraverymenu
cls
echo %lang_ultimate_bravery% Batch - v%pversion%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 1.) %lang_summoners_rift% (%lang_no_smite%)
echo 2.) %lang_twisted_treeline% (%lang_no_smite%)
echo 3.) %lang_howling_abyss%
echo 4.) %lang_summoners_rift% (%lang_smite%)
echo 5.) %lang_twisted_treeline% (%lang_smite%)
CHOICE /C 12345 /M "Select a map for %lang_team_bravery%."
goto :teambravery


:teambravery
IF ERRORLEVEL 5 goto :TTTEAMSMITE
IF ERRORLEVEL 4 goto :SRTEAMSMITE
IF ERRORLEVEL 3 goto :ARAMTEAM
IF ERRORLEVEL 2 goto :TTTEAM
IF ERRORLEVEL 1 goto :SRTEAM
:backteam
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
echo %lang_sending_team_braveries% teambravery.txt .
PING 1.1.1.1 -n 1 -w 1500 >NUL
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
echo %lang_sending_team_braveries% teambravery.txt ..
PING 1.1.1.1 -n 1 -w 1500 >NUL
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
echo %lang_sending_team_braveries% teambravery.txt ...
PING 1.1.1.1 -n 1 -w 1500 >NUL
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
echo %lang_team_braveries_found% teambravery.txt.
echo %lang_press_key_exit%
pause >nul
exit


:SRTEAM
break>teambravery.txt
if exist Resources/Champs.txt (
  goto :nextteamsr
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:nextteamsr
if exist Resources/Items.txt (
  goto :next2teamsr
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next2teamsr
if exist Resources/Adjectives.txt (
  goto :next3teamsr
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next3teamsr
if exist Resources/Boots.txt (
  goto :next4teamsr
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next4teamsr
if exist Resources/Max.txt (
  goto :next5teamsr
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next5teamsr
if exist Resources/Summoners1.txt (
  goto :next6teamsr
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next6teamsr
if exist Resources/Summoners2.txt (
  goto :next7teamsr
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next7teamsr
if exist Resources/Masteries.txt (
  goto :next8teamsr
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next8teamsr
if exist Resources/Trinket.txt (
  goto :next9teamsr
) else (
  echo %DATE% %TIME% Trinket.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next9teamsr
set enableboots=1
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr
)
:show10teamsr
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr
)
:showteamsr
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr
)
:show9teamsr
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr
)
:show1teamsr
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr
)
:show2teamsr
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr
)
)
:show8teamsr
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr
)
:show3teamsr
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr
)
:show4teamsr
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr
)
:show5teamsr
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr
)
:show6teamsr
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr
)
:show7teamsr
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr
)
:show11teamsr
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr
)
:show12teamsr
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr2
)
:show10teamsr2
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr2
)
:showteamsr2
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr2
)
:show9teamsr2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr2
)
:show1teamsr2
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr2
)
:show2teamsr2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr2
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr2
)
)
:show8teamsr2
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr2
)
:show3teamsr2
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr2
)
:show4teamsr2
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr2
)
:show5teamsr2
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr2
)
:show6teamsr2
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr2
)
:show7teamsr2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr2
)
:show11teamsr2
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr2
)
:show12teamsr2
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr3
)
:show10teamsr3
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
goto showteamsr3
)
:showteamsr3
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr3
)
:show9teamsr3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr3
)
:show1teamsr3
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr3
)
:show2teamsr3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr3
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr3
)
)
:show8teamsr3
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr3
)
:show3teamsr3
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr3
)
:show4teamsr3
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr3
)
:show5teamsr3
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr3
)
:show6teamsr3
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr3
)
:show7teamsr3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr3
)
:show11teamsr3
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr3
)
:show12teamsr3
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr4
)
:show10teamsr4
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr4
)
:showteamsr4
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr4
)
:show9teamsr4
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr4
)
:show1teamsr4
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr4
)
:show2teamsr4
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr4
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr4
)
)
:show8teamsr4
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr4
)
:show3teamsr4
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr4
)
:show4teamsr4
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr4
)
:show5teamsr4
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr4
)
:show6teamsr4
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr4
)
:show7teamsr4
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr4
)
:show11teamsr4
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr4
)
:show12teamsr4
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr5
)
:show10teamsr5
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr5
)
:showteamsr5
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr5
)
:show9teamsr5
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr5
)
:show1teamsr5
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr5
)
:show2teamsr5
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr5
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr5
)
)
:show8teamsr5
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr5
)
:show3teamsr5
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr5
)
:show4teamsr5
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr5
)
:show5teamsr5
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr5
)
:show6teamsr5
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr5
)
:show7teamsr5
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr5
)
:show11teamsr5
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr5
)
:show12teamsr5
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
goto :backteam

:SRTEAMSMITE
break>teambravery.txt
if exist Resources/Champs.txt (
  goto :nextteamsrsmite
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:nextteamsrsmite
if exist Resources/Items.txt (
  goto :next2teamsrsmite
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next2teamsrsmite
if exist Resources/Adjectives.txt (
  goto :next3teamsrsmite
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next3teamsrsmite
if exist Resources/Boots.txt (
  goto :next4teamsrsmite
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next4teamsrsmite
if exist Resources/Max.txt (
  goto :next5teamsrsmite
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next5teamsrsmite
if exist Resources/Summoners1.txt (
  goto :next6teamsrsmite
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next6teamsrsmite
if exist Resources/Summoners2.txt (
  goto :next7teamsrsmite
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next7teamsrsmite
if exist Resources/Masteries.txt (
  goto :next8teamsrsmite
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next8teamsrsmite
if exist Resources/Trinket.txt (
  goto :next9teamsrsmite
) else (
  echo %DATE% %TIME% Trinket.txt %lang_missing_gen% >> errorlog.txt
  pause >nul
  exit
)
:next9teamsrsmite
set enableboots=1
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsrsmite
)
:show10teamsrsmite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsrsmite
)
:showteamsrsmite
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsrsmite
)
:show9teamsrsmite
echo. >> teambravery.txt
echo Smite teambravery.txt
goto show1teamsrsmite
)
:show1teamsrsmite
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsrsmite
)
:show2teamsrsmite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsrsmite
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsrsmite
)
)
:show8teamsrsmite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsrsmite
)
:show3teamsrsmite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsrsmite
)
:show4teamsrsmite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsrsmite
)
:show5teamsrsmite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsrsmite
)
:show6teamsrsmite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsrsmite
)
:show7teamsrsmite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsrsmite
)
:show11teamsrsmite
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsrsmite
)
:show12teamsrsmite
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr2smite
)
:show10teamsr2smite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr2smite
)
:showteamsr2smite
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr2smite
)
:show9teamsr2smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr2smite
)
:show1teamsr2smite
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr2smite
)
:show2teamsr2smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr2smite
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr2smite
)
)
:show8teamsr2smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr2smite
)
:show3teamsr2smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr2smite
)
:show4teamsr2smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr2smite
)
:show5teamsr2smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr2smite
)
:show6teamsr2smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr2smite
)
:show7teamsr2smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr2smite
)
:show11teamsr2smite
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr2smite
)
:show12teamsr2smite
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr3smite
)
:show10teamsr3smite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr3smite
)
:showteamsr3smite
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr3smite
)
:show9teamsr3smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr3smite
)
:show1teamsr3smite
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr3smite
)
:show2teamsr3smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr3smite
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr3smite
)
)
:show8teamsr3smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr3smite
)
:show3teamsr3smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr3smite
)
:show4teamsr3smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr3smite
)
:show5teamsr3smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr3smite
)
:show6teamsr3smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr3smite
)
:show7teamsr3smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr3smite
)
:show11teamsr3smite
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr3smite
)
:show12teamsr3smite
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr4smite
)
:show10teamsr4smite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr4smite
)
:showteamsr4smite
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr4smite
)
:show9teamsr4smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr4smite
)
:show1teamsr4smite
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr4smite
)
:show2teamsr4smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr4smite
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr4smite
)
)
:show8teamsr4smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr4smite
)
:show3teamsr4smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr4smite
)
:show4teamsr4smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr4smite
)
:show5teamsr4smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr4smite
)
:show6teamsr4smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr4smite
)
:show7teamsr4smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr4smite
)
:show11teamsr4smite
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr4smite
)
:show12teamsr4smite
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_summoners_rift%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto :show10teamsr5smite
)
:show10teamsr5smite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto showteamsr5smite
)
:showteamsr5smite
SET /A LSkip3=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto show9teamsr5smite
)
:show9teamsr5smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%summoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto show1teamsr5smite
)
:show1teamsr5smite
SET /A LSkip=%RANDOM%%%%summoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto show2teamsr5smite
)
:show2teamsr5smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr5smite
)
)
SET /A LSkip=%RANDOM%%%%items%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show8teamsr5smite
)
)
:show8teamsr5smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show3teamsr5smite
)
:show3teamsr5smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show4teamsr5smite
)
:show4teamsr5smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show5teamsr5smite
)
:show5teamsr5smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show6teamsr5smite
)
:show6teamsr5smite
SET /A LSkip=%RANDOM%%%%items%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Items.txt) do (
echo %%a >> teambravery.txt
goto show7teamsr5smite
)
:show7teamsr5smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto show11teamsr5smite
)
:show11teamsr5smite
SET /A LSkip=%RANDOM%%%%trinket%+1
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Trinket.txt) do (
echo %%a >> teambravery.txt
goto show12teamsr5smite
)
:show12teamsr5smite
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
goto :backteam

:TTTEAM
break>teambravery.txt
if exist Resources/Champs.txt (
  goto :ttnextteam
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:ttnextteam
if exist Resources/TT/Items.txt (
  goto :ttnext2team
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_tt% >> errorlog.txt
  echo Items.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext2team
if exist Resources/Adjectives.txt (
  goto :ttnext3team
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext3team
if exist Resources/Boots.txt (
  goto :ttnext4team
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext4team
if exist Resources/Max.txt (
  goto :ttnext5team
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext5team
if exist Resources/TT/Summoners1.txt (
  goto :ttnext6team
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners1.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext6team
if exist Resources/TT/Summoners2.txt (
  goto :ttnext7team
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners2.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext7team
if exist Resources/Masteries.txt (
  goto :ttnext8team
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext8team
set enableboots=1
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto ttshow10team
)
:ttshow10team
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto ttshowteam
)
:ttshowteam
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto ttshow9team
)
:ttshow9team
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%ttsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto ttshow1team
)
:ttshow1team
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto ttshow2team
)
:ttshow2team
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team
)
)
:ttshow8team
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow3team
)
:ttshow3team
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow4team
)
:ttshow4team
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow5team
)
:ttshow5team
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow6team
)
:ttshow6team
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow7team
)
:ttshow7team
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto ttshow11team
)
:ttshow11team
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto ttshow10team2
)
:ttshow10team2
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto ttshowteam2
)
:ttshowteam2
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto ttshow9team2
)
:ttshow9team2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%ttsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto ttshow1team2
)
:ttshow1team2
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto ttshow2team2
)
:ttshow2team2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team2
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team2
)
)
:ttshow8team2
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow3team2
)
:ttshow3team2
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow4team2
)
:ttshow4team2
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow5team2
)
:ttshow5team2
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow6team2
)
:ttshow6team2
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow7team2
)
:ttshow7team2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto ttshow11team2
)
:ttshow11team2
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto ttshow10team3
)
:ttshow10team3
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto ttshowteam3
)
:ttshowteam3
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto ttshow9team3
)
:ttshow9team3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%ttsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto ttshow1team3
)
:ttshow1team3
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto ttshow2team3
)
:ttshow2team3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team3
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team3
)
)
:ttshow8team3
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow3team3
)
:ttshow3team3
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow4team3
)
:ttshow4team3
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow5team3
)
:ttshow5team3
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow6team3
)
:ttshow6team3
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow7team3
)
:ttshow7team3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto ttshow11team3
)
:ttshow11team3
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
goto :backteam

:TTTEAMSMITE
break>teambravery.txt
if exist Resources/Champs.txt (
  goto :ttnextteamsmite
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:ttnextteamsmite
if exist Resources/TT/Items.txt (
  goto :ttnext2teamsmite
) else (
  echo %DATE% %TIME% Items.txt %lang_missing_tt% >> errorlog.txt
  echo Items.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext2teamsmite
if exist Resources/Adjectives.txt (
  goto :ttnext3teamsmite
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext3teamsmite
if exist Resources/Boots.txt (
  goto :ttnext4teamsmite
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext4teamsmite
if exist Resources/Max.txt (
  goto :ttnext5teamsmite
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext5teamsmite
if exist Resources/TT/Summoners1.txt (
  goto :ttnext6teamsmite
) else (
  echo %DATE% %TIME% Summoners1.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners1.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext6teamsmite
if exist Resources/TT/Summoners2.txt (
  goto :ttnext7teamsmite
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_tt% >> errorlog.txt
  echo Summoners2.txt %lang_missing_tt%
  pause >nul
  exit
)
:ttnext7teamsmite
if exist Resources/Masteries.txt (
  goto :ttnext8teamsmite
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:ttnext8teamsmite
set enableboots=1
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto ttshow10teamsmite
)
:ttshow10teamsmite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto ttshowteamsmite
)
:ttshowteamsmite
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto ttshow9teamsmite
)
:ttshow9teamsmite
echo. >> teambravery.txt
echo Smite >> teambravery.txt
goto ttshow1teamsmite
)
:ttshow1teamsmite
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto ttshow2teamsmite
)
:ttshow2teamsmite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto ttshow8teamsmite
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow8teamsmite
)
)
:ttshow8teamsmite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow3teamsmite
)
:ttshow3teamsmite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow4teamsmite
)
:ttshow4teamsmite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow5teamsmite
)
:ttshow5teamsmite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow6teamsmite
)
:ttshow6teamsmite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow7teamsmite
)
:ttshow7teamsmite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto ttshow11teamsmite
)
:ttshow11teamsmite
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto ttshow10team2smite
)
:ttshow10team2smite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto ttshowteam2smite
)
:ttshowteam2smite
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto ttshow9team2smite
)
:ttshow9team2smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%ttsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto ttshow1team2smite
)
:ttshow1team2smite
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto ttshow2team2smite
)
:ttshow2team2smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team2smite
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team2smite
)
)
:ttshow8team2smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow3team2smite
)
:ttshow3team2smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow4team2smite
)
:ttshow4team2smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow5team2smite
)
:ttshow5team2smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow6team2smite
)
:ttshow6team2smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow7team2smite
)
:ttshow7team2smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto ttshow11team2smite
)
:ttshow11team2smite
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo ------------------------------%lang_map% %lang_twisted_treeline%------------------------------ >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto ttshow10team3smite
)
:ttshow10team3smite
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto ttshowteam3smite
)
:ttshowteam3smite
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto ttshow9team3smite
)
:ttshow9team3smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%ttsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto ttshow1team3smite
)
:ttshow1team3smite
SET /A LSkip=%RANDOM%%%%ttsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto ttshow2team3smite
)
:ttshow2team3smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team3smite
)
)
SET /A LSkip=%RANDOM%%%%ttitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow8team3smite
)
)
:ttshow8team3smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow3team3smite
)
:ttshow3team3smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow4team3smite
)
:ttshow4team3smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow5team3smite
)
:ttshow5team3smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow6team3smite
)
:ttshow6team3smite
SET /A LSkip=%RANDOM%%%%ttitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/TT/Items.txt) do (
echo %%a >> teambravery.txt
goto ttshow7team3smite
)
:ttshow7team3smite
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto ttshow11team3smite
)
:ttshow11team3smite
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
goto :backteam

:ARAMTEAM
break>teambravery.txt
if exist Resources/Champs.txt (
  goto :aramnextteam
) else (
  echo %DATE% %TIME% Champs.txt %lang_missing_gen% >> errorlog.txt
  echo Champs.txt %lang_missing_gen% 
  pause >nul
  exit
)
:aramnextteam
if exist Resources/ARAM/Items.txt (
  goto :aramnext2team
) else (
  echo %DATE% %TIME% ARAMItems.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMItems.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext2team
if exist Resources/Adjectives.txt (
  goto :aramnext3team
) else (
  echo %DATE% %TIME% Adjectives.txt %lang_missing_gen% >> errorlog.txt
  echo Adjectives.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext3team
if exist Resources/Boots.txt (
  goto :aramnext4team
) else (
  echo %DATE% %TIME% Boots.txt %lang_missing_gen% >> errorlog.txt
  echo Boots.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext4team
if exist Resources/Max.txt (
  goto :aramnext5team
) else (
  echo %DATE% %TIME% Max.txt %lang_missing_gen% >> errorlog.txt
  echo Max.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext5team
if exist Resources/ARAM/Summoners1.txt (
  goto :aramnext6team
) else (
  echo %DATE% %TIME% ARAMSummoners1.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMSummoners1.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext6team
if exist Resources/ARAM/Summoners2.txt (
  goto :aramnext7team
) else (
  echo %DATE% %TIME% Summoners2.txt %lang_missing_aram% >> errorlog.txt
  echo ARAMSummoners2.txt %lang_missing_aram%
  pause >nul
  exit
)
:aramnext7team
if exist Resources/Masteries.txt (
  goto :aramnext8team
) else (
  echo %DATE% %TIME% Masteries.txt %lang_missing_gen% >> errorlog.txt
  echo Masteries.txt %lang_missing_gen%
  pause >nul
  exit
)
:aramnext8team
set enableboots=1
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------- >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto aramshow10team
)
:aramshow10team
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto aramshowteam
)
:aramshowteam
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto aramshow9team
)
:aramshow9team
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%aramsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto aramshow1team
)
:aramshow1team
SET /A LSkip=%RANDOM%%%%aramsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto aramshow2team
)
:aramshow2team
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team
)
)
SET /A LSkip=%RANDOM%%%%aramitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team
)
)
:aramshow8team
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow3team
)
:aramshow3team
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow4team
)
:aramshow4team
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow5team
)
:aramshow5team
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow6team
)
:aramshow6team
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow7team
)
:aramshow7team
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto aramshow11team
)
:aramshow11team
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------- >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto aramshow10team2
)
:aramshow10team2
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto aramshowteam2
)
:aramshowteam2
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto aramshow9team2
)
:aramshow9team2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%aramsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto aramshow1team2
)
:aramshow1team2
SET /A LSkip=%RANDOM%%%%aramsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto aramshow2team2
)
:aramshow2team2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team2
)
)
SET /A LSkip=%RANDOM%%%%aramitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team2
)
)
:aramshow8team2
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow3team2
)
:aramshow3team2
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow4team2
)
:aramshow4team2
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow5team2
)
:aramshow5team2
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow6team2
)
:aramshow6team2
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow7team2
)
:aramshow7team2
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto aramshow11team2
)
:aramshow11team2
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------- >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto aramshow10team3
)
:aramshow10team3
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto aramshowteam3
)
:aramshowteam3
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto aramshow9team3
)
:aramshow9team3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%aramsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto aramshow1team3
)
:aramshow1team3
SET /A LSkip=%RANDOM%%%%aramsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto aramshow2team3
)
:aramshow2team3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team3
)
)
SET /A LSkip=%RANDOM%%%%aramitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team3
)
)
:aramshow8team3
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow3team3
)
:aramshow3team3
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow4team3
)
:aramshow4team3
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow5team3
)
:aramshow5team3
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow6team3
)
:aramshow6team3
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow7team3
)
:aramshow7team3
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto aramshow11team3
)
:aramshow11team3
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------- >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto aramshow10team4
)
:aramshow10team4
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto aramshowteam4
)
:aramshowteam4
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto aramshow9team4
)
:aramshow9team4
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%aramsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto aramshow1team4
)
:aramshow1team4
SET /A LSkip=%RANDOM%%%%aramsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto aramshow2team4
)
:aramshow2team4
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team4
)
)
SET /A LSkip=%RANDOM%%%%aramitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team4
)
)
:aramshow8team4
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow3team4
)
:aramshow3team4
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow4team4
)
:aramshow4team4
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow5team4
)
:aramshow5team4
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow6team4
)
:aramshow6team4
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow7team4
)
:aramshow7team4
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto aramshow11team4
)
:aramshow11team4
set enableboots=1
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
echo                                 %lang_ultimate_bravery% >> teambravery.txt
echo                                 by TheTrain2000 >> teambravery.txt
echo                                %lang_current_patch% %patch% >> teambravery.txt
echo -------------------------------%lang_map% %lang_howling_abyss%-------------------------------- >> teambravery.txt
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%adjectives%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Adjectives.txt) do (
echo %%a >> teambravery.txt
goto aramshow10team5
)
:aramshow10team5
SET /A LSkip=%RANDOM%%%%champs%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Champs.txt) do (
echo %%a >> teambravery.txt
if %%a==%cass% set enableboots=0
goto aramshowteam5
)
:aramshowteam5
SET /A LSkip=%RANDOM%%%%max%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Max.txt) do (
echo %%a >> teambravery.txt
goto aramshow9team5
)
:aramshow9team5
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%aramsummoners2%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners2.txt) do (
echo %%a >> teambravery.txt
goto aramshow1team5
)
:aramshow1team5
SET /A LSkip=%RANDOM%%%%aramsummoners1%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Summoners1.txt) do (
echo %%a >> teambravery.txt
goto aramshow2team5
)
:aramshow2team5
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%boots%+1
if %enableboots%==1 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/Boots.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team5
)
)
SET /A LSkip=%RANDOM%%%%aramitems%+1
if %enableboots%==0 (
for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow8team5
)
)
:aramshow8team5
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow3team5
)
:aramshow3team5
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow4team5
)
:aramshow4team5
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow5team5
)
:aramshow5team5
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow6team5
)
:aramshow6team5
SET /A LSkip=%RANDOM%%%%aramitems%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/ARAM/Items.txt) do (
echo %%a >> teambravery.txt
goto aramshow7team5
)
:aramshow7team5
echo. >> teambravery.txt
SET /A LSkip=%RANDOM%%%%masteries%+1

for /f "skip=%LSkip% tokens=*" %%a in (Resources/Masteries.txt) do (
echo %%a >> teambravery.txt
goto aramshow11team5
)
:aramshow11team5
echo. >> teambravery.txt
echo. >> teambravery.txt
echo. >> teambravery.txt
set enableboots=1
goto :backteam



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