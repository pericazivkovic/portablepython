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

Section "!Python 3.2.5 core" PYTHON_CORE
	SectionIn 1 2 RO
	SetOutPath "$INSTDIR"
	File /r "${SOURCESFOLDER}\python-core\*.*"
	File "${SOURCESFOLDER}\Python-Portable.exe"
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
	Section "PyODBC 3.0.2" MODULE_PYODBC
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyodbc\PLATLIB\*.*"
	SectionEnd
	Section "PyQT 4.9.6-1" MODULE_PYQT
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\"
		File /r "${SOURCESFOLDER}\pyqt\Lib\*.*"
		SetOutPath "$INSTDIR"
		File "${SOURCESFOLDER}\QtDesigner-Portable.exe"
	SectionEnd
	Section "IPython 0.13.1" MODULE_IPYTHON
		SectionIn 1
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\ipython\PURELIB\*.*"
		SetOutPath "$INSTDIR\App\Lib\site-packages\"
		File /r "${SOURCESFOLDER}\pyreadline\PURELIB\*.*"
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
		SectionIn 1 2
		SetOutPath "$INSTDIR"
		File /r "${SOURCESFOLDER}\PyScripter\*.*"
		File "${SOURCESFOLDER}\PyScripter-Portable.exe"
	SectionEnd
	Section "PyCharm Community 3.1.1" IDE_PYCHARM
		SectionIn 1
		SetOutPath "$INSTDIR"
		File /r "${SOURCESFOLDER}\PyCharm\*.*"
		File "${SOURCESFOLDER}\PyCharm-Portable.exe"
	SectionEnd	
SectionGroupEnd



