; =================================================================
; The MIT License (MIT)
; Copyright (c) 2007 Perica Zivkovic
 
; Permission is hereby granted, free of charge, to any person obtaining a copy 
; of this software and associated documentation files (the "Software"), to deal 
; in the Software without restriction, including without limitation the rights 
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
; copies of the Software, and to permit persons to whom the Software is furnished 
; to do so, subject to the following conditions:
 
; The above copyright notice and this permission notice shall be included in all 
; copies or substantial portions of the Software.
 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
; DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
; OTHER DEALINGS IN THE SOFTWARE.

; http://PortablePython.com
; =================================================================

InstType "Full"
InstType "Minimal"

Section "!Python 2.7.11 core" PYTHON_CORE
	SectionIn 1 2 RO
	SetOutPath "$INSTDIR"
	File /r "${SOURCESFOLDER}\python-core\*.*"
	File "${SOURCESFOLDER}\Python-Portable.exe"
	File "${SOURCESFOLDER}\PythonW-Portable.exe"
	File "${SOURCESFOLDER}\IDLE-Portable.exe"
	File "${SOURCESFOLDER}\PortablePythonPrompt.cmd"
SectionEnd
SectionGroup "Modules"
	Section "NumPy 1.9.2" MODULE_NUMPY
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\numpy\PLATLIB\*.*"
	SectionEnd
	Section "SciPy 0.15.1" MODULE_SCIPY
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\scipy\PLATLIB\*.*"
	SectionEnd
	Section "PyWin32 220" MODULE_PYWIN32
		SectionIn 1
		SetOutPath "$INSTDIR\App\"
		File /r "${SOURCESFOLDER}\pywin32\*.*"
	SectionEnd
	Section "NetworkX 1.11" MODULE_NETWORKX
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\networkx\"
		File /r "${SOURCESFOLDER}\networkx\networkx\*.*"
	SectionEnd
	Section "Django 1.6.2" MODULE_DJANGO
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\django\"
		File /r "${SOURCESFOLDER}\django\Django-1.6.2\django\*.*"
		SetOutPath "$INSTDIR\App\Scripts"
		File "${SOURCESFOLDER}\django\Django-1.6.2\django\bin\django-admin.py"
	SectionEnd
	Section "PIL 1.1.7" MODULE_PIL
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pil\PLATLIB\*.*"
	SectionEnd
	Section "Py2Exe 0.6.9" MODULE_PY2EXE
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\py2exe\PLATLIB\*.*"
	SectionEnd
	Section "wxPython 3.0.0.0" MODULE_WXPYTHON
		SectionIn 1
		SetOutPath "$INSTDIR\App\"
		File /r "${SOURCESFOLDER}\wxpython\package\*.*"
	SectionEnd
	Section "matplotlib 1.4.3" MODULE_MATPLOTLIB
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\matplotlib\PLATLIB\*.*"
	SectionEnd
	Section "lxml 3.4.3" MODULE_LXML
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\lxml\PLATLIB\*.*"
	SectionEnd
	Section "PySerial 2.7" MODULE_PY_SERIAL
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyserial\PURELIB\*.*"
	SectionEnd
/* 	since pyodbc moved from google to github - installation via pip is required
	Section "PyODBC 3.0.7" MODULE_PYODBC
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyodbc\PLATLIB\*.*"
	SectionEnd
 */	Section "PyGame 1.9.1" MODULE_PYGAME
		SectionIn 1
		SetOutPath "$INSTDIR\App\"
		File /r "${SOURCESFOLDER}\pygame\*.*"
	SectionEnd
	Section "PyGTK 2.24.2" MODULE_PYGTK
		SectionIn 1
		SetOutPath "$INSTDIR\App\"
		File /r "${SOURCESFOLDER}\pygtk\*.*"
		SetOutPath "$INSTDIR"
		File "${SOURCESFOLDER}\Glade3-Portable.exe"
	SectionEnd
	Section "PyQT 4.11.3" MODULE_PYQT
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\"
		File /r "${SOURCESFOLDER}\pyqt\Lib\*.*"
		SetOutPath "$INSTDIR\App\Lib\site-packages\PyQT4\"
		File /r "${SOURCESFOLDER}\pyqt\$[31]\*.*"
		SetOutPath "$INSTDIR\App\"
		File "${SOURCESFOLDER}\qt.conf"
		SetOutPath "$INSTDIR"
		File "${SOURCESFOLDER}\QtDesigner-Portable.exe"
	SectionEnd
	Section "IPython 1.2.1" MODULE_IPYTHON
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\IPython"
		File /r "${SOURCESFOLDER}\ipython\\ipython-1.2.1\IPython\*.*"
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyreadline\pyreadline-1.7.1\*.*"
		SetOutPath "$INSTDIR"
		File "${SOURCESFOLDER}\IPython-Portable.exe"
	SectionEnd
	Section "Pandas 0.16.0" MODULE_PANDAS
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pandas\*.*"
	SectionEnd 
	Section "Dateutil 2.2" MODULE_DATEUTIL
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\dateutil\"
		File /r "${SOURCESFOLDER}\dateutil\python-dateutil-2.2\dateutil\*.*"
	SectionEnd 
	Section "PyParsing 2.0.1" MODULE_PYPARSING
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyparsing\PURELIB\*.*"
	SectionEnd 
	Section "Six 1.6.1" MODULE_SIX
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File "${SOURCESFOLDER}\SIX\six-1.6.1\six.py"
	SectionEnd 
	Section "XLUtils 1.7.0" MODULE_XLUTILS
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\xlutils\"
		File /r "${SOURCESFOLDER}\XLUTILS\xlutils-1.7.0\xlutils\*.*"
	SectionEnd
	Section "xlrd 0.9.2" MODULE_XLRD
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\xlrd\"
		File /r "${SOURCESFOLDER}\xlrd\xlrd-0.9.2\xlrd\*.*"
	SectionEnd
	Section "xlwt 0.7.5" MODULE_XLWT
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\xlwt\"
		File /r "${SOURCESFOLDER}\xlwt\xlwt-0.7.5\xlwt\*.*"
	SectionEnd
	Section "OpenPyXL 1.8.5" MODULE_OPENPYXL
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\openpyxl\"
		File /r "${SOURCESFOLDER}\openpyxl\openpyxl-1.8.5\openpyxl\*.*"
	SectionEnd
SectionGroupEnd


SectionGroup "Code editors"
	Section "PyScripter 2.6.0" IDE_PYSCRIPTER
		SectionIn 1
		SetOutPath "$INSTDIR"
		File /r "${SOURCESFOLDER}\PyScripter\*.*"
		File "${SOURCESFOLDER}\PyScripter-Portable.exe"
	SectionEnd
	Section "PyCharm Community 2016.3.1" IDE_PYCHARM
		SectionIn 1
		SetOutPath "$INSTDIR"
		File /r "${SOURCESFOLDER}\PyCharm\*.*"
		File "${SOURCESFOLDER}\PyCharm-Portable.exe"
	SectionEnd	
SectionGroupEnd

; pip section is an extract from 
; https://github.com/wheeler-microfluidics/microdrop_portable_python_base/blob/microdrop/2.7/modules.nsh
; many thanks to Christian Frobel for these piece of work

SectionGroup "`pip` packages"
    Section "Prepare `easy_install` and `pip`"
        Var /GLOBAL EasyInstall
        Var /GLOBAL Pip
        Var /GLOBAL PipInstallFlags
        SectionIn 1 2 RO
        StrCpy $EasyInstall '$INSTDIR\App\Scripts\easy_install.exe'
        StrCpy $Pip '$INSTDIR\App\Scripts\pip.exe'
        ; Use `--pre` argument to allow installation of [pre-release][1]
        ; package versions.
        ;
        ; [1]: http://stackoverflow.com/questions/18230956/could-not-find-a-version-that-satisfies-the-requirement-pytz
        StrCpy $PipInstallFlags '--no-cache-dir'
    SectionEnd

    Section "Install pip"
        SectionIn 1 2 RO
        nsExec::ExecToLog '$EasyInstall pip'
    SectionEnd
	
    Section "Install ipython"  PIP_MODULE_IPYTHON
        ;SectionIn 1
	    ;not in section 'full', cause IPython 0.13.1 already included
		;this is just an example, how packges could be installed via pip
		;known problem: 
		; - with pip installed scripts App\Scripts\iXYZ-script.py incudes "hard coded" python path
		; - if the pp installation moves, these paths must be adapted manually
        nsExec::ExecToLog '$Pip install $PipInstallFlags ipython'
    SectionEnd
    Section "Install PyODBC"  PIP_MODULE_PYODBC
        SectionIn 1
		;known problem: 
		; - with pip installed scripts App\Scripts\iXYZ-script.py incudes "hard coded" python path
		; - if the pp installation moves, these paths must be adapted manually
        nsExec::ExecToLog '$Pip install $PipInstallFlags pyodbc'
    SectionEnd
	
SectionGroupEnd

; Section dependencies
Function .onSelChange
	${Unless} ${SectionIsSelected} ${MODULE_DATEUTIL}
        !insertmacro UnselectSection ${MODULE_MATPLOTLIB}
	${EndIf}
	${Unless} ${SectionIsSelected} ${MODULE_PYPARSING}
        !insertmacro UnselectSection ${MODULE_MATPLOTLIB}
	${EndIf}
	${Unless} ${SectionIsSelected} ${MODULE_SIX}
        !insertmacro UnselectSection ${MODULE_PANDAS}
	${EndIf}
	${Unless} ${SectionIsSelected} ${MODULE_XLRD}
        !insertmacro UnselectSection ${MODULE_XLUTILS}
	${EndIf}
	${Unless} ${SectionIsSelected} ${MODULE_XLWT}
        !insertmacro UnselectSection ${MODULE_XLUTILS}
	${EndIf}		
FunctionEnd
