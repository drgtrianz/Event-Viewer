@echo off
rem Script starts here
rem Timestamp Generator

set BACKUP_PATH=%1

rem Parse the date (e.g., Thu 02/28/2013)
set cur_yyyy=%date:~10,4%
set cur_mm=%date:~4,2%
set cur_dd=%date:~7,2%

rem Parse the time (e.g., 11:20:56.39)
set cur_hh=%time:~0,2%
if %cur_hh% lss 10 (set cur_hh=0%time:~1,1%)
set cur_nn=%time:~3,2%
set cur_ss=%time:~6,2%
set cur_ms=%time:~9,2%

rem Set the timestamp format
set timestamp=%cur_yyyy%%cur_mm%%cur_dd%-%cur_hh%%cur_nn%%cur_ss%%cur_ms%

wevtutil epl System %BACKUP_PATH%\system_%timestamp%.evtx
wevtutil epl Application %BACKUP_PATH%\application_%timestamp%.evtx
wevtutil epl Security %BACKUP_PATH%\security_%timestamp%.evtx

echo "Backup files created successfully at path " %BACKUP_PATH% " With Time Stamp " %timestamp%

rem End of Script
