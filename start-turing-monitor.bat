@echo off
rem Kill any previous instance
taskkill /F /FI "WINDOWTITLE eq Turing System Monitor" >nul 2>&1

rem Start silently without any window
cd /d "C:\Tweeks\3.5inch mini Display"
start "" /B "C:\anaconda\pythonw.exe" "main.py"

rem Exit this batch script immediately
exit