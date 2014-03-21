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

:: Include common functions
set COMMON=.\..\common.bat

:: CHECK Parameter, maybe only a subset of packages should be build 
if [%1]==[] (SET _packagelist=All) ELSE (SET _packagelist=%*)
for %%G in (%_packagelist%) do (call :Unpack%%G)
goto:EOF

:UnpackAll

call :UnpackPython
call :UnpackPyScripter 
call :UnpackNumPy
call :UnpackSciPy
call :UnpackPyWin32
call :UnpackNetworkX
call :UnpackDjango
call :UnpackPIL
call :UnpackPy2Exe
call :UnpackWxPython
call :UnpackMatplotlib
call :UnpackLXML
call :UnpackPySerial
call :UnpackPyODBC
call :UnpackPyGame
call :UnpackPyGTK
call :UnpackPyQT
call :UnpackIPython
call :UnpackPandas

goto:EOF

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPython
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts Python core files and patches MSCRT
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download python
call COMMON :DownloadFile %PY_MSI_DOWNLOAD%

:: Verify python core
call COMMON :VerifyFile %PY_MSI_FILE% MD5 %PY_MSI_MD5%

:: Unpack python core
call COMMON :LogMessage "Extracting python core files"
msiexec /quiet /a "%BIN_FOLDER%\%PY_MSI_FILE%" TARGETDIR="%UNPACK_FOLDER%\python-core\App"

:: Unpack MSCRT patch
call COMMON :LogMessage "Extracting MSCRT patch"
tools\uniextract16\UniExtract.exe patches\Microsoft.VC90.CRT.PPpatch %UNPACK_FOLDER%\python-core\App >NUL

:: Download setuptools
call COMMON :DownloadFile %PY_SETUPTOOLS_DOWNLOAD%
:: Verify setuptools
call COMMON :VerifyFile %PY_SETUPTOOLS_FILE% MD5 %PY_SETUPTOOLS_MD5%

:: Unpack SetupTools
call COMMON :LogMessage "Extracting setuptools"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PY_SETUPTOOLS_FILE%" %UNPACK_FOLDER%\setuptools >NUL

:: Copy setuptools
call COMMON :LogMessage "Copy setuptools"
mkdir "%UNPACK_FOLDER%\python-core\App\Scripts\"
xcopy /EY %UNPACK_FOLDER%\setuptools\PURELIB\*.* "%UNPACK_FOLDER%\python-core\App\Lib\site-packages\" >NUL
xcopy /EY %UNPACK_FOLDER%\setuptools\SCRIPTS\*.* "%UNPACK_FOLDER%\python-core\App\Scripts\" >NUL

:: Configure prompt
echo import sys >> "%UNPACK_FOLDER%\python-core\App\Lib\ppp.py"
echo sys.ps1 = "Portable Python >>> " >> "%UNPACK_FOLDER%\python-core\App\Lib\ppp.py"

:: Build Shortcut
call COMMON :LogMessage "Build shortcut"
tools\nsis\makensis.exe /V0 /DSHORTCUTNAME=Python /DPY_VERSION=%PY_VERSION% /DPP_VERSION=%PP_VERSION% shortcuts\shortcut.nsi
tools\nsis\makensis.exe /V0 /DSHORTCUTNAME=PythonW /DPY_VERSION=%PY_VERSION% /DPP_VERSION=%PP_VERSION% shortcuts\shortcut.nsi
tools\nsis\makensis.exe /V0 /DSHORTCUTNAME=IDLE /DPY_VERSION=%PY_VERSION% /DPP_VERSION=%PP_VERSION% shortcuts\shortcut.nsi

:: Copy shortcut
call COMMON :LogMessage "Copy Python Portable shortcut"
copy shortcuts\Python-Portable.exe "%UNPACK_FOLDER%" 1>NUL
copy shortcuts\PythonW-Portable.exe "%UNPACK_FOLDER%" 1>NUL
copy shortcuts\IDLE-Portable.exe "%UNPACK_FOLDER%" 1>NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\python-core\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPyScripter
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts pyScripter 
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download PyScripter
call COMMON :DownloadFile %PY_SCRIPTER_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %PY_SCRIPTER_FILE% SHA1 %PY_SCRIPTER_SHA1%

:: Unpack files
call COMMON :LogMessage "Extracting PyScripter files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PY_SCRIPTER_FILE%" %UNPACK_FOLDER%\pyscripter-temp >NUL

:: Copy files to PyScripter folder
call COMMON :LogMessage "Copy files to PyScripter folder"
mkdir %UNPACK_FOLDER%\PyScripter
mkdir %UNPACK_FOLDER%\PyScripter\App
mkdir %UNPACK_FOLDER%\PyScripter\App\locale
mkdir %UNPACK_FOLDER%\PyScripter\App\Skins
copy %UNPACK_FOLDER%\pyscripter-temp\PyScripter\PyScripter.exe "%UNPACK_FOLDER%\PyScripter\App\" >NUL
copy %UNPACK_FOLDER%\pyscripter-temp\PyScripter\PyScripter.chm "%UNPACK_FOLDER%\PyScripter\App\" >NUL
copy %UNPACK_FOLDER%\pyscripter-temp\PyScripter\PyProject.ico "%UNPACK_FOLDER%\PyScripter\App\" >NUL
xcopy /EY %UNPACK_FOLDER%\pyscripter-temp\PyScripter\locale "%UNPACK_FOLDER%\PyScripter\App\locale" >NUL

:: Unpack rpyc
call COMMON :LogMessage "Unpack rypc"
tools\uniextract16\UniExtract.exe "%UNPACK_FOLDER%\pyscripter-temp\PyScripter\Lib\rpyc.zip" %UNPACK_FOLDER%\PyScripter\App\Lib\site-packages\ >NUL

:: Patch PyScripter
call COMMON :LogMessage "Patch PyScripter"
tools\uniextract16\UniExtract.exe patches\PyScripter.2.5.3.PPpatch %UNPACK_FOLDER%\PyScripter\App >NUL

:: Build Shortcut
call COMMON :LogMessage "Build PyScripter shortcut"
tools\nsis\makensis.exe /V0 /DSHORTCUTNAME=PyScripter /DPY_VERSION=%PY_VERSION% /DPP_VERSION=%PP_VERSION% /DPY_SHORT_VERSION=%PY_SHORT_VERSION% shortcuts\shortcut.nsi

:: Copy shortcuts
call COMMON :LogMessage "Copy PyScripter shortcut"
copy shortcuts\PyScripter-Portable.exe "%UNPACK_FOLDER%" >NUL

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackNumPy
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts numpy 
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %NUMPY_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %NUMPY_FILE% MD5 %NUMPY_ZIP_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting NumPy files"
tools\uniextract16\bin\7z.exe x "%BIN_FOLDER%\%NUMPY_FILE%" -o%UNPACK_FOLDER%\numpy\ -y
tools\uniextract16\UniExtract.exe "%UNPACK_FOLDER%\numpy\%NUMPY_FILE_NOSSE%" %UNPACK_FOLDER%\numpy\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\numpy\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackSciPy
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts scipy 
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %SCIPY_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %SCIPY_FILE% MD5 %SCIPY_ZIP_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting SciPy files"
tools\uniextract16\bin\7z.exe x "%BIN_FOLDER%\%SCIPY_FILE%" -o%UNPACK_FOLDER%\scipy\ -y
tools\uniextract16\UniExtract.exe "%UNPACK_FOLDER%\scipy\%SCIPY_FILE_NOSSE%" %UNPACK_FOLDER%\scipy\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\scipy\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPyWin32
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts pywin32 
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PYWIN32_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %PYWIN32_FILE% MD5 %PYWIN32_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting PyWin32 files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PYWIN32_FILE%" %UNPACK_FOLDER%\pywin32-temp\

mkdir %UNPACK_FOLDER%\pywin32\
mkdir %UNPACK_FOLDER%\pywin32\Lib
mkdir %UNPACK_FOLDER%\pywin32\Lib\site-packages\

xcopy /EY %UNPACK_FOLDER%\pywin32-temp\PLATLIB\pywin32_system32\*.* %UNPACK_FOLDER%\pywin32\ >NUL
rmdir /S /Q %UNPACK_FOLDER%\pywin32-temp\PLATLIB\pywin32_system32
xcopy /EY %UNPACK_FOLDER%\pywin32-temp\PLATLIB\*.* %UNPACK_FOLDER%\pywin32\Lib\site-packages\ >NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pywin32\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackNetworkX
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts networkx 
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %NETWORKX_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %NETWORKX_FILE% MD5 %NETWORKX_MD5%
	
:: Unpack files
call COMMON :LogMessage "Extracting networkx files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%NETWORKX_FILE%" %UNPACK_FOLDER%\networkx\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\networkx\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackDjango
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts django  
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %DJANGO_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %DJANGO_FILE% MD5 %DJANGO_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting Django files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%DJANGO_FILE%" %UNPACK_FOLDER%\django\
tools\uniextract16\UniExtract.exe "%UNPACK_FOLDER%\django\dist\%DJANGO_FILE_TAR%" %UNPACK_FOLDER%\django\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\django\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPIL
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts PIL  
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PIL_DOWNLOAD%

:: Unpack files
call COMMON :LogMessage "Extracting PIL files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PIL_FILE%" %UNPACK_FOLDER%\pil\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pil\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPy2Exe
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts Py2Exe  
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PY2EXE_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %PY2EXE_FILE% MD5 %PY2EXE_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting Py2Exe files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PY2EXE_FILE%" %UNPACK_FOLDER%\py2exe\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\py2exe\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackWxPython
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts WxPython  
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %WXPYTHON_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %WXPYTHON_FILE% MD5 %WXPYTHON_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting WxPython files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%WXPYTHON_FILE%" %UNPACK_FOLDER%\wxpython\
mkdir %UNPACK_FOLDER%\wxpython\package\
mkdir %UNPACK_FOLDER%\wxpython\package\Lib\
mkdir %UNPACK_FOLDER%\wxpython\package\Lib\site-packages\
copy %UNPACK_FOLDER%\wxpython\{code_GetPythonDir}\unicows.dll %UNPACK_FOLDER%\wxpython\package\ >NUL
xcopy /EY %UNPACK_FOLDER%\wxpython\{app}\*.* %UNPACK_FOLDER%\wxpython\package\Lib\site-packages\ >NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\wxpython\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackMatplotlib
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts Matplotlib  
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %MATPLOTLIB_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %MATPLOTLIB_FILE% MD5 %MATPLOTLIB_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting matplotlib files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%MATPLOTLIB_FILE%" %UNPACK_FOLDER%\matplotlib\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\matplotlib\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackLXML
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts LXML  
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %LXML_DOWNLOAD%

:: Unpack files
call COMMON :LogMessage "Extracting LXML files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%LXML_FILE%" %UNPACK_FOLDER%\lxml\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\lxml\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPySerial
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts PySerial 
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PY_SERIAL_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %PY_SERIAL_FILE% MD5 %PY_SERIAL_MD5%
	
:: Unpack files
call COMMON :LogMessage "Extracting PySerial files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PY_SERIAL_FILE%" %UNPACK_FOLDER%\pyserial\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pyserial\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPyODBC
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts PyODBC
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download
call COMMON :DownloadFile %PYODBC_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %PYODBC_FILE% SHA1 %PYODBC_SHA1%
	
:: Unpack files
call COMMON :LogMessage "Extracting PyODBC files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PYODBC_FILE%" %UNPACK_FOLDER%\pyodbc\

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pyodbc\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPyGame
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts PyGame
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PYGAME_DOWNLOAD%

:: Unpack files
call COMMON :LogMessage "Extracting PyGame files"
msiexec /quiet /a "%BIN_FOLDER%\%PYGAME_FILE%" TARGETDIR="%UNPACK_FOLDER%\pygame\"

:: Cleanup
del /F /Q "%UNPACK_FOLDER%\pygame\%PYGAME_FILE%"

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pygame\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPyGTK
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts PyGTK
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PYGTK_DOWNLOAD%

:: Unpack files
call COMMON :LogMessage "Extracting PyGTK files"
msiexec /quiet /a "%BIN_FOLDER%\%PYGTK_FILE%" TARGETDIR="%UNPACK_FOLDER%\pygtk\"

:: Build Shortcut
call COMMON :LogMessage "Build Glade3 shortcut"
tools\nsis\makensis.exe /V0 /DSHORTCUTNAME=Glade3 /DPY_VERSION=%PY_VERSION% /DPP_VERSION=%PP_VERSION% /DPY_SHORT_VERSION=%PY_SHORT_VERSION% shortcuts\shortcut.nsi

:: Copy shortcut
call COMMON :LogMessage "Copy Glade3 Portable shortcut"
copy shortcuts\Glade3-Portable.exe "%UNPACK_FOLDER%" 1>NUL

:: Cleanup
del /F /Q "%UNPACK_FOLDER%\pygtk\%PYGTK_FILE%"
del /F /Q "%UNPACK_FOLDER%\pygtk\Lib\site-packages\gtk-2.0\runtime\bin\glade-3.exe.manifest"

:: Unpack MSCRT patch
call COMMON :LogMessage "Extracting MSCRT patch"
tools\uniextract16\UniExtract.exe patches\Microsoft.VC90.CRT.PPpatch %UNPACK_FOLDER%\pygtk\Lib\site-packages\gtk-2.0\runtime\bin >NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pygtk\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPyQT
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts PyQT
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PYQT_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %PYQT_FILE% MD5 %PYQT_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting PyQT files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PYQT_FILE%" %UNPACK_FOLDER%\pyqt\

:: Patch uic
call COMMON :LogMessage "Patching PyQt4 uic"
echo "#" > "%UNPACK_FOLDER%\pyqt\$[31]\uic\port_v2\__init__.py"

:: Patch Qt.conf
echo [Paths] >> "%UNPACK_FOLDER%\pyqt\Lib\site-packages\PyQt4\qt.conf"
echo Prefix = . >> "%UNPACK_FOLDER%\pyqt\Lib\site-packages\PyQt4\qt.conf"
echo Binaries = . >> "%UNPACK_FOLDER%\pyqt\Lib\site-packages\PyQt4\qt.conf"

echo [Paths] >> "%UNPACK_FOLDER%\qt.conf"
echo Prefix = . >> "%UNPACK_FOLDER%\qt.conf"
echo Binaries = . >> "%UNPACK_FOLDER%\qt.conf"
echo Plugins = ./Lib/site-packages/PyQt4/plugins >> "%UNPACK_FOLDER%\qt.conf"

:: Unpack MSCRT patch
call COMMON :LogMessage "Extracting MSCRT patch"
tools\uniextract16\UniExtract.exe patches\Microsoft.VC90.CRT.PPpatch %UNPACK_FOLDER%\pyqt\Lib\site-packages\PyQt4 >NUL

:: Build Shortcut
call COMMON :LogMessage "Build QtDesigner shortcut"
tools\nsis\makensis.exe /V0 /DSHORTCUTNAME=QtDesigner /DPY_VERSION=%PY_VERSION% /DPP_VERSION=%PP_VERSION% /DPY_SHORT_VERSION=%PY_SHORT_VERSION% shortcuts\shortcut.nsi

:: Copy shortcut
call COMMON :LogMessage "Copy QtDesigner Portable shortcut"
copy shortcuts\QtDesigner-Portable.exe "%UNPACK_FOLDER%" 1>NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pyqt\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackIPython
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts IPython  
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %IPYTHON_DOWNLOAD%

:: Verify 
call COMMON :VerifyFile %IPYTHON_FILE% MD5 %IPYTHON_MD5%

:: Unpack files
call COMMON :LogMessage "Extracting IPython files"
tools\uniextract16\bin\7z.exe x "%BIN_FOLDER%\%IPYTHON_FILE%" -o%UNPACK_FOLDER%\ipython\ -y >NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\ipython\

:: Unpack files
call COMMON :LogMessage "Extracting PyReadline files"
tools\uniextract16\bin\7z.exe x patches\pyreadline-1.7.1.PPpatch -o%UNPACK_FOLDER%\pyreadline\ -y >NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pyreadline\

:: Build Shortcuts
call COMMON :LogMessage "Build shortcuts"
tools\nsis\makensis.exe /V0 /DSHORTCUTNAME=IPython /DPY_VERSION=%PY_VERSION% /DPP_VERSION=%PP_VERSION% shortcuts\shortcut.nsi

:: Copy shortcut
call COMMON :LogMessage "Copy Python Portable shortcut"
copy shortcuts\IPython-Portable.exe "%UNPACK_FOLDER%" 1>NUL

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:UnpackPandas
::
:: By:   Perica Zivkovic
:: Func: Downloads and extracts Pandas
:: Args: none
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
setlocal ENABLEEXTENSIONS

:: Download 
call COMMON :DownloadFile %PANDAS_DOWNLOAD%

:: Unpack files
call COMMON :LogMessage "Extracting Pandas files"
tools\uniextract16\UniExtract.exe "%BIN_FOLDER%\%PANDAS_FILE%" %UNPACK_FOLDER%\pandas\ >NUL

:: Fix
call COMMON :FixMSCRT %UNPACK_FOLDER%\pandas\

endlocal&goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::