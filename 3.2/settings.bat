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

set PY_VERSION=3.2
set PP_VERSION=5.1
set PY_SHORT_VERSION=32

:: Modules
set PY_MSI_DOWNLOAD="http://python.org/ftp/python/3.2.5/python-3.2.5.msi"
set PY_MSI_FILE=python-3.2.5.msi
set PY_MSI_MD5=cdd6fdc59461c968bd105fdf08f4a17d

set PY_DISTRIBUTE_VERSION=distribute-0.6.34
set PY_DISTRIBUTE_DOWNLOAD="http://pypi.python.org/packages/source/d/distribute/%PY_DISTRIBUTE_VERSION%.tar.gz"
set PY_DISTRIBUTE_TAR=%PY_DISTRIBUTE_VERSION%.tar
set PY_DISTRIBUTE_FILE=%PY_DISTRIBUTE_VERSION%.tar.gz
set PY_DISTRIBUTE_MD5=4576ab843a6db5100fb22a72deadf56d

set PY_SCRIPTER_DOWNLOAD="http://pyscripter.googlecode.com/files/PyScripter-v2.5.3.zip"
set PY_SCRIPTER_FILE=PyScripter-v2.5.3.zip
set PY_SCRIPTER_SHA1=363226a2dc708bc5dd83eda9ccc36339b79a7345

set NUMPY_DOWNLOAD="http://sourceforge.net/projects/numpy/files/NumPy/1.7.1/numpy-1.7.1-win32-superpack-python3.2.exe"
set NUMPY_FILE=numpy-1.7.1-win32-superpack-python3.2.exe
set NUMPY_FILE_NOSSE=numpy-1.7.1-nosse.exe
set NUMPY_ZIP_MD5=bb0d30de007d649757a2d6d2e1c59c9a

set SCIPY_DOWNLOAD="http://sourceforge.net/projects/scipy/files/scipy/0.12.0/scipy-0.12.0-win32-superpack-python3.2.exe"
set SCIPY_FILE=scipy-0.12.0-win32-superpack-python3.2.exe
set SCIPY_FILE_NOSSE=scipy-0.12.0-nosse.exe
set SCIPY_ZIP_MD5=391b306093c43f58d6588cee76bf0c10  

set PYWIN32_DOWNLOAD="http://sourceforge.net/projects/pywin32/files/pywin32/Build 218/pywin32-218.win32-py3.2.exe"
set PYWIN32_FILE=pywin32-218.win32-py3.2.exe
set PYWIN32_MD5=527c69c12ab817d2d325b378adb32583

set NETWORKX_DOWNLOAD="http://pypi.python.org/packages/3.2/n/networkx/networkx-1.7-py3.2.egg"
set NETWORKX_FILE=networkx-1.7-py3.2.egg
set NETWORKX_MD5=5a852d8e2c815dd69ffce22e6056af9e

set MATPLOTLIB_DOWNLOAD="http://sourceforge.net/projects/matplotlib/files/matplotlib/matplotlib-1.2.1/matplotlib-1.2.1.win32-py3.2.exe"
set MATPLOTLIB_FILE=matplotlib-1.2.1.win32-py3.2.exe
set MATPLOTLIB_MD5=e888b2d1d3e2d914209a1c46532384fc

set LXML_DOWNLOAD="http://pypi.python.org/packages/3.2/l/lxml/lxml-2.3.win32-py3.2.exe"
set LXML_FILE=lxml-2.3.win32-py3.2.exe

set PY_SERIAL_DOWNLOAD="http://pypi.python.org/packages/any/p/pyserial/pyserial-py3k-2.5.win32.exe"
set PY_SERIAL_FILE=pyserial-py3k-2.5.win32.exe
set PY_SERIAL_MD5=c7d770dede6f6c6197d9652a7658f18e

set PYODBC_DOWNLOAD="http://pyodbc.googlecode.com/files/pyodbc-3.0.2.win32-py3.2.exe"
set PYODBC_FILE=pyodbc-3.0.2.win32-py3.2.exe
set PYODBC_SHA1=9abe8b36be9f3a2dbb427a4a049e9b70cd909c6d

set PYQT_DOWNLOAD="http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.9.6/PyQt-Py3.2-x86-gpl-4.9.6-1.exe"
set PYQT_FILE=PyQt-Py3.2-x86-gpl-4.9.6-1.exe
set PYQT_MD5=9c4a1b3b1246e936c3439c0e8a1d5774

set IPYTHON_DOWNLOAD="http://pypi.python.org/packages/any/i/ipython/ipython-0.13.1.py3-win32.exe"
set IPYTHON_FILE=ipython-0.13.1.py3-win32.exe
set IPYTHON_MD5=43c1c567b920b718a38fffd1866a4392

set PANDAS_DOWNLOAD="https://pypi.python.org/packages/3.2/p/pandas/pandas-0.11.0.win32-py3.2.exe"
set PANDAS_FILE=pandas-0.11.0.win32-py3.2.exe
set PANDAS_MD5=7f11d2f59284c5ba64e7d781e1023f95

set PYCHARM_DOWNLOAD="http://download.jetbrains.com/python/pycharm-community-3.1.1.exe"
set PYCHARM_FILE=pycharm-community-3.1.1.exe
set PYCHARM_MD5=610522DA6E8092896CEDA4355C2DBFC6