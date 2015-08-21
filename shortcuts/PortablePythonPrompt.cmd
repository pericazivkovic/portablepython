@ECHO OFF 
@set PATH=%~dp0App;%~dp0App\Scripts;%PATH%
@set PYTHONHOME=%~dp0App
@set PYTHONPATH=
@set PYTHONSTARTUP=%~dp0App\Lib\ppp.py
start cmd.exe /k for /f "usebackq tokens=* delims=" %%v in (`python -V`) do @title Portable %%v
