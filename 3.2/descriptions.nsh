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

; This file keeps generic mofule descriptions. 
; Don't use any version numbers here as it is shared between versions.

LangString DESC_PYTHON_CORE ${LANG_ENGLISH} "Installs Python core engine. This component is required and can not be deselected."
LangString DESC_IDE_PYSCRIPTER ${LANG_ENGLISH} "PyScripter is a free and open-source Python Integrated Development Environment (IDE)."
LangString DESC_IDE_PYCHARM ${LANG_ENGLISH} "PyCharm Community is a free Python Integrated Development Environment (IDE)."
LangString DESC_MODULE_PYWIN32 ${LANG_ENGLISH} "Python Extensions for Windows."
LangString DESC_MODULE_NETWORKX ${LANG_ENGLISH} "Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks."
LangString DESC_MODULE_PY_SERIAL ${LANG_ENGLISH} "This module encapsulates the access for the serial port."
LangString DESC_MODULE_NUMPY ${LANG_ENGLISH} "NumPy is the fundamental package needed for scientific computing with Python."
LangString DESC_MODULE_SCIPY ${LANG_ENGLISH} "SciPy is open-source software for mathematics, science, and engineering"
LangString DESC_MODULE_MATPLOTLIB ${LANG_ENGLISH} "2D plotting library which produces publication quality figures in a variety of hardcopy formats and interactive environments across platforms"
LangString DESC_MODULE_LXML ${LANG_ENGLISH} "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
LangString DESC_MODULE_PYODBC ${LANG_ENGLISH} "Module that allows you to use ODBC to connect to almost any database from Windows, Linux, OS/X, and more."
LangString DESC_MODULE_PYQT ${LANG_ENGLISH} "PYQT is a set of Python bindings for Nokia's Qt application framework implemented as a set of Python modules and contain over 300 classes and over 6,000 functions and methods."
LangString DESC_MODULE_IPYTHON ${LANG_ENGLISH} "IPython provides a rich toolkit to help you make the most out of using Python interactively."
LangString DESC_MODULE_PANDAS ${LANG_ENGLISH} "Pandas is a Python package providing fast, flexible, and expressive data structures designed to make working with structured (tabular, multidimensional, potentially heterogeneous) and time series data both easy and intuitive."


!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${PYTHON_CORE} $(DESC_PYTHON_CORE)
  !insertmacro MUI_DESCRIPTION_TEXT ${IDE_PYSCRIPTER} $(DESC_IDE_PYSCRIPTER)
  !insertmacro MUI_DESCRIPTION_TEXT ${IDE_PYCHARM} $(DESC_IDE_PYCHARM)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYWIN32} $(DESC_MODULE_PYWIN32)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_NETWORKX} $(DESC_MODULE_NETWORKX)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PY_SERIAL} $(DESC_MODULE_PY_SERIAL)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_NUMPY} $(DESC_MODULE_NUMPY)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_SCIPY} $(DESC_MODULE_SCIPY)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_MATPLOTLIB} $(DESC_MODULE_MATPLOTLIB)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_LXML} $(DESC_MODULE_LXML)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYODBC} $(DESC_MODULE_PYODBC)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYQT} $(DESC_MODULE_PYQT)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_IPYTHON} $(DESC_MODULE_IPYTHON)
!insertmacro MUI_FUNCTION_DESCRIPTION_END