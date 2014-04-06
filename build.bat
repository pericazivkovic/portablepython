:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: The MIT License (MIT)
:: Copyright (c) 2007 Perica Zivkovic
 
:: Permission is hereby granted, free of charge, to any person obtaining a 
:: copy of this software and associated documentation files (the "Software"), 
:: to deal in the Software without restriction, including without limitation 
:: the rights to use, copy, modify, merge, publish, distribute, sublicense, 
:: and/or sell copies of the Software, and to permit persons to whom the 
:: Software is furnished to do so, subject to the following conditions:
 
:: The above copyright notice and this permission notice shall be included 
:: in all copies or substantial portions of the Software.
 
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
:: OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
:: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
:: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
:: WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
:: CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

:: http://PortablePython.com
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

:: Include common functions
set COMMON=.\..\common.bat

if "" == "%1" (
		call COMMON :EchoUsage 
		goto:eof
	)

set USE_CACHE=TRUE
if "--clean" == "%2" (
		set USE_CACHE=FALSE
	)
	
call COMMON :LogMessage
call COMMON :LogMessage "Portable Python build script started :: %date% %time%"
call COMMON :LogMessage
call COMMON :LogMessage "Building distribution based on Python %1"
	
:: Check can we find config dir
if not exist %1 (
		call COMMON :LogMessage "ERROR: Config folder not found for this version !! Aborting..."
		goto:eof
	)

:: Load variables for specified version
call .\%1\settings.bat 

set TEMP_FOLDER=%TEMP%PortablePython.v.%PY_VERSION%.%PP_VERSION%.Build
set BIN_FOLDER=%TEMP_FOLDER%\binaries
set UNPACK_FOLDER=%TEMP_FOLDER%\unpacked
set OUTPUT_FOLDER=%TEMP_FOLDER%\output

:: Delete log files
if exist %TEMP_FOLDER%\Build.log (
		del %TEMP_FOLDER%\Build.log
	)

if exist %TEMP_FOLDER%\Fix.log (
		del %TEMP_FOLDER%\Fix.log
	)

:: Prepare temporary folder
if not exist %TEMP_FOLDER% ( 
		mkdir %TEMP_FOLDER%
		:: Create working folder structure
		mkdir %BIN_FOLDER%
		mkdir %UNPACK_FOLDER%
		mkdir %OUTPUT_FOLDER%		
	) else (
		if not %USE_CACHE% == TRUE (
			call COMMON :LogMessage "Not using cache - deleting all temp files"
			rmdir /s /q %TEMP_FOLDER%
			mkdir %TEMP_FOLDER%
			:: Create working folder structure
			mkdir %BIN_FOLDER%
			mkdir %UNPACK_FOLDER%
			mkdir %OUTPUT_FOLDER%
		) else (
			call COMMON :LogMessage "Deleting output files but keeping old binaries - USE_CACHE = TRUE"
			rmdir /s /q %UNPACK_FOLDER%
			rmdir /s /q %OUTPUT_FOLDER%
			mkdir %UNPACK_FOLDER%
			mkdir %OUTPUT_FOLDER%
		)
	)
	
:: Extract modules
call .\%1\modules.bat 

:: Build installer
call COMMON :LogMessage 
call COMMON :LogMessage "Building Portable Python %PY_VERSION%.%PP_VERSION% installer ..."
tools\nsis\makensis /V0 /DPY_VERSION=%1 /DPP_VERSION=%PP_VERSION% /DOUTPUT_FOLDER="%OUTPUT_FOLDER%" /DSOURCES_FOLDER="%UNPACK_FOLDER%" main.nsi
call COMMON :LogMessage 
call COMMON :LogMessage "Portable Python build script completed at :: %date% %time%"
call COMMON :LogMessage "Installer ready at: %OUTPUT_FOLDER%"