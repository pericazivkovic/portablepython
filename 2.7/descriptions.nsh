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

; This file keeps generic module descriptions. 
; Don't use any version numbers here as it is shared between versions.

LangString DESC_PYTHON_CORE ${LANG_ENGLISH} "Installs Python core engine. This component is required and can not be deselected."
LangString DESC_IDE_PYSCRIPTER ${LANG_ENGLISH} "PyScripter is a free and open-source Python Integrated Development Environment (IDE)."
LangString DESC_IDE_PYCHARM ${LANG_ENGLISH} "PyCharm Community is a free Python Integrated Development Environment (IDE)."
LangString DESC_MODULE_NUMPY ${LANG_ENGLISH} "NumPy is the fundamental package needed for scientific computing with Python."
LangString DESC_MODULE_SCIPY ${LANG_ENGLISH} "SciPy is open-source software for mathematics, science, and engineering"
LangString DESC_MODULE_PYWIN32 ${LANG_ENGLISH} "Python Extensions for Windows"
LangString DESC_MODULE_NETWORKX ${LANG_ENGLISH} "Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks."
LangString DESC_MODULE_DJANGO ${LANG_ENGLISH} "High-level Python Web framework that encourages rapid development and clean, pragmatic design."
LangString DESC_MODULE_PIL ${LANG_ENGLISH} "The Python Imaging Library supports many file formats, and provides powerful image processing and graphics capabilities."
LangString DESC_MODULE_PY2EXE ${LANG_ENGLISH} "The Distutils extension which converts Python scripts into executable Windows programs, able to run without requiring a Python installation."
LangString DESC_MODULE_WXPYTHON ${LANG_ENGLISH} "wxPython is a GUI toolkit for the Python programming language"
LangString DESC_MODULE_MATPLOTLIB ${LANG_ENGLISH} "2D plotting library which produces publication quality figures in a variety of hardcopy formats and interactive environments across platforms"
LangString DESC_MODULE_LXML ${LANG_ENGLISH} "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
LangString DESC_MODULE_PY_SERIAL ${LANG_ENGLISH} "This module encapsulates the access for the serial port."
LangString DESC_MODULE_PYODBC ${LANG_ENGLISH} "Module that allows you to use ODBC to connect to almost any database from Windows, Linux, OS/X, and more."
LangString DESC_MODULE_PYGAME ${LANG_ENGLISH} "Pygame adds functionality on top of the excellent SDL library so that you can create fully featured games and multimedia programs."
LangString DESC_MODULE_PYGTK ${LANG_ENGLISH} "PyGTK lets you to easily create programs with a graphical user interface using the Python programming language."
LangString DESC_MODULE_PYQT ${LANG_ENGLISH} "PYQT is a set of Python bindings for Nokia's Qt application framework implemented as a set of Python modules and contain over 300 classes and over 6,000 functions and methods."
LangString DESC_MODULE_IPYTHON ${LANG_ENGLISH} "IPython provides a rich toolkit to help you make the most out of using Python interactively."
LangString DESC_MODULE_PANDAS ${LANG_ENGLISH} "Pandas is a Python package providing fast, flexible, and expressive data structures designed to make working with structured (tabular, multidimensional, potentially heterogeneous) and time series data both easy and intuitive."
LangString DESC_MODULE_DATEUTIL ${LANG_ENGLISH} "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
LangString DESC_MODULE_PYPARSING ${LANG_ENGLISH} "The pyparsing module is an alternative approach to creating and executing simple grammars, vs. the traditional lex/yacc approach, or the use of regular expressions."
LangString DESC_MODULE_SIX ${LANG_ENGLISH} "Six is a Python 2 and 3 compatibility library. It provides utility functions for smoothing over the differences between the Python versions with the goal of writing Python code that is compatible on both Python versions."
LangString DESC_MODULE_XLRD ${LANG_ENGLISH} "Library for developers to extract data from Microsoft Excel (tm) spreadsheet files"
LangString DESC_MODULE_XLWT ${LANG_ENGLISH} "Library to create spreadsheet files compatible with MS Excel 97/2000/XP/2003 XLS files, on any platform, with Python 2.3 to 2.7"
LangString DESC_MODULE_XLUTILS ${LANG_ENGLISH} "Utilities for working with Excel files that require both xlrd and xlwt"
LangString DESC_MODULE_OPENPYXL ${LANG_ENGLISH} "A Python library to read/write Excel 2007 xlsx/xlsm files"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${PYTHON_CORE} $(DESC_PYTHON_CORE)
  !insertmacro MUI_DESCRIPTION_TEXT ${IDE_PYSCRIPTER} $(DESC_IDE_PYSCRIPTER)
  !insertmacro MUI_DESCRIPTION_TEXT ${IDE_PYCHARM} $(DESC_IDE_PYCHARM)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_NUMPY} $(DESC_MODULE_NUMPY)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_SCIPY} $(DESC_MODULE_SCIPY)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYWIN32} $(DESC_MODULE_PYWIN32)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_NETWORKX} $(DESC_MODULE_NETWORKX)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_DJANGO} $(DESC_MODULE_DJANGO)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PIL} $(DESC_MODULE_PIL)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PY2EXE} $(DESC_MODULE_PY2EXE)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_WXPYTHON} $(DESC_MODULE_WXPYTHON)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_MATPLOTLIB} $(DESC_MODULE_MATPLOTLIB)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_LXML} $(DESC_MODULE_LXML)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PY_SERIAL} $(DESC_MODULE_PY_SERIAL)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYODBC} $(DESC_MODULE_PYODBC)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYGAME} $(DESC_MODULE_PYGAME)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYGTK} $(DESC_MODULE_PYGTK)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYQT} $(DESC_MODULE_PYQT)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_IPYTHON} $(DESC_MODULE_IPYTHON)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PANDAS} $(DESC_MODULE_PANDAS)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_DATEUTIL} $(DESC_MODULE_DATEUTIL)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_PYPARSING} $(DESC_MODULE_PYPARSING)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_SIX} $(DESC_MODULE_SIX)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_XLRD} $(DESC_MODULE_XLRD)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_XLWT} $(DESC_MODULE_XLWT)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_XLUTILS} $(DESC_MODULE_XLUTILS)
  !insertmacro MUI_DESCRIPTION_TEXT ${MODULE_OPENPYXL} $(DESC_MODULE_OPENPYXL)
!insertmacro MUI_FUNCTION_DESCRIPTION_END