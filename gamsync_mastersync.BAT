@echo off
set CSVFile=C:\gamsync\mastergamsync.csv
set PowerShellScript=C:\gamsync\gamsync_domainquery.ps1
set FileSizeThreshold=1024

cd "C:\gamadv-xtd3"
del /s "c:\gamsync\*sync.csv"
gam print users allfields > C:\gamsync\mastergamsync.csv

REM Check if the CSV file exists and its size
for /f "tokens=*" %%A in ('powershell.exe -command "(Get-Item '%CSVFile%').length"') do set FileSize=%%A

if exist "%CSVFile%" (
    if %FileSize% GTR %FileSizeThreshold% (
        REM CSV file exists and is larger than the threshold, run the PowerShell script
        C:\gamsync\gamsync_exportvalidator.BAT
        powershell.exe -ExecutionPolicy Bypass -File "C:\gamsync\gamsync_query.ps1"
	powershell.exe -ExecutionPolicy Bypass -File "C:\gamsync\gamsync_log.ps1"
        C:\gamsync\gamsync_export.BAT
	msg * "Sync Completed Sucessfully. Please check the log directory."
	exit
    ) else (
        REM CSV file is smaller than the threshold, send a failure message
        msg * "Failed master database has not been generated correctly. Please validate prerequisites."
	exit
    )
) else (
    REM CSV file doesn't exist, send a failure message
    msg * "Failed master database not generated. Prerequisites missing."
	exit
)
