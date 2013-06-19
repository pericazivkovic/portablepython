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
call %*
goto:EOF

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:LogMessage message
::
:: By:   Perica Zivkovic
:: Func: Logs informational message
:: Args: message - string to log
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
echo ::  %~1
endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:FixMSCRT folder
::
:: By:   Perica Zivkovic
:: Func: Removes MSCRT dependencies from .dll and .pyd files
:: Args: path - path to process (including subfolders)
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
echo -- Fixing path: %~1 >> %TEMP_FOLDER%\Fix.log
tools\fix\fix.exe %~1 >> %TEMP_FOLDER%\Fix.log
endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ExtractFileName fullURL
::
:: By:   Perica Zivkovic
:: Func: Extracts last part of the string delimited by "/"
:: Args: fullURL - string to log
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
set var1=%~1
set var2=%var1%
set i=0

:loopprocess
for /F "tokens=1* delims=/ " %%A in ( "%var1%" ) do (
  set /A i+=1
  set var1=%%B
  goto loopprocess )

for /F "tokens=%i% delims=/ " %%G in ( "%var2%" ) do set last=%%G

call :LogMessage 
call :LogMessage "Downloading: %last%"
>> %TEMP_FOLDER%\Build.log echo %last%

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:DownloadFile file
::
:: By:   Perica Zivkovic
:: Func: Downloads specified file with WGET
:: Args: file
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
call :ExtractFileName "%~1"

tools\wget\wget.exe --no-check-certificate -nv -q -N -P "%BIN_FOLDER%" "%~1" 2>NUL
endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:VerifyFile fileName hashType hashValue
::
:: By:   Perica Zivkovic
:: Func: Verify file by using MD5 or SHA hash
:: Args: fileName, hashType, hashValue
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
set fileName=%~1
set hashType=%~2
set hashValue=%~3

call :LogMessage "Verifying %hashType% hash %hashValue% for file %fileName%"
echo %hashValue% ?%hashType%*%BIN_FOLDER%\%fileName% > "%UNPACK_FOLDER%\%fileName%.%hashType%"
tools\fsum\fsum.exe -c -%hashType% "%UNPACK_FOLDER%\%fileName%.%hashType%" 2>NUL
if not %ERRORLEVEL% == 0 (
		call :LogMessage "ERROR: File %fileName% does not have correct hash !! Aborting..."
		goto:eof
	)
endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:EchoUsage
::
:: By:   Perica Zivkovic
:: Func: Prints usage information
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS
echo ::
echo ::  Usage: build version [--clean]
echo ::         - version: version of the python core to use for build in 
echo ::                    major.minor format, eg. 3.2 will build new
echo ::                    Portable Python distribution based on Python 3.2
echo ::
echo ::			--clean will force clean build - remove all cached binaries 
echo ::
endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::