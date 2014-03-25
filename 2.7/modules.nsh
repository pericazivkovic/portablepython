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

Section "!Python 2.7.5 core" PYTHON_CORE
	SectionIn 1 2 RO
	SetOutPath "$INSTDIR"
	File /r "${SOURCESFOLDER}\python-core\*.*"
	File "${SOURCESFOLDER}\Python-Portable.exe"
	File "${SOURCESFOLDER}\PythonW-Portable.exe"
	File "${SOURCESFOLDER}\IDLE-Portable.exe"
SectionEnd
SectionGroup "Modules"
	Section "NumPy 1.7.1" MODULE_NUMPY
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\numpy\PLATLIB\*.*"
	SectionEnd
	Section "SciPy 0.12.0" MODULE_SCIPY
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\scipy\PLATLIB\*.*"
	SectionEnd
	Section "PyWin32 218" MODULE_PYWIN32
		SectionIn 1
		SetOutPath "$INSTDIR\App\"
		File /r "${SOURCESFOLDER}\pywin32\*.*"
	SectionEnd
	Section "NetworkX 1.7" MODULE_NETWORKX
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\networkx\"
		File /r "${SOURCESFOLDER}\networkx\networkx\*.*"
	SectionEnd
	Section "Django 1.5.1" MODULE_DJANGO
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\django\"
		File /r "${SOURCESFOLDER}\django\Django-1.5.1\django\*.*"
		SetOutPath "$INSTDIR\App\Scripts"
		File "${SOURCESFOLDER}\django\Django-1.5.1\django\bin\django-admin.py"
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
	Section "wxPython 2.9.4.0" MODULE_WXPYTHON
		SectionIn 1
		SetOutPath "$INSTDIR\App\"
		File /r "${SOURCESFOLDER}\wxpython\package\*.*"
	SectionEnd
	Section "matplotlib 1.2.1" MODULE_MATPLOTLIB
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\matplotlib\PLATLIB\*.*"
	SectionEnd
	Section "lxml 2.3" MODULE_LXML
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\lxml\PLATLIB\*.*"
	SectionEnd
	Section "PySerial 2.5" MODULE_PY_SERIAL
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyserial\PURELIB\*.*"
	SectionEnd
	Section "PyODBC 3.0.6" MODULE_PYODBC
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyodbc\PLATLIB\*.*"
	SectionEnd
	Section "PyGame 1.9.1" MODULE_PYGAME
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
	Section "PyQT 4.10.1" MODULE_PYQT
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
	Section "IPython 0.13.1" MODULE_IPYTHON
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\IPython"
		File /r "${SOURCESFOLDER}\ipython\IPython\*.*"
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyreadline\pyreadline-1.7.1\*.*"
		SetOutPath "$INSTDIR"
		File "${SOURCESFOLDER}\IPython-Portable.exe"
	SectionEnd
	Section "Pandas 0.11.0" MODULE_PANDAS
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pandas\PLATLIB\*.*"
	SectionEnd 
SectionGroupEnd

SectionGroup "Code editors"
	Section "PyScripter 2.5.3" IDE_PYSCRIPTER
		SectionIn 1
		SetOutPath "$INSTDIR"
		File /r "${SOURCESFOLDER}\PyScripter\*.*"
		File "${SOURCESFOLDER}\PyScripter-Portable.exe"
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
        StrCpy $PipInstallFlags ' --pre '
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
        nsExec::ExecToLog '$Pip install ipython $PipInstallFlags'
    SectionEnd
	
SectionGroupEnd