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

set PY_VERSION=2.7
set PP_VERSION=6.1
set PY_SHORT_VERSION=27

:: Core
set PY_MSI_DOWNLOAD="http://python.org/ftp/python/2.7.6/python-2.7.6.msi"
set PY_MSI_FILE=python-2.7.6.msi
set PY_MSI_MD5=ac54e14f7ba180253b9bae6635d822ea

:: Modules
set PY_SETUPTOOLS_DOWNLOAD="http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11.win32-py2.7.exe"
set PY_SETUPTOOLS_FILE=setuptools-0.6c11.win32-py2.7.exe
set PY_SETUPTOOLS_MD5=57e1e64f6b7c7f1d2eddfc9746bbaf20

set PY_SCRIPTER_DOWNLOAD="http://pyscripter.googlecode.com/files/PyScripter-v2.5.3.zip"
set PY_SCRIPTER_FILE=PyScripter-v2.5.3.zip
set PY_SCRIPTER_SHA1=363226a2dc708bc5dd83eda9ccc36339b79a7345

set NUMPY_DOWNLOAD="http://sourceforge.net/projects/numpy/files/NumPy/1.8.1/numpy-1.8.1-win32-superpack-python2.7.exe"
set NUMPY_FILE=numpy-1.8.1-win32-superpack-python2.7.exe
set NUMPY_FILE_NOSSE=numpy-1.8.1-nosse.exe
set NUMPY_ZIP_MD5=47dcbfaba32a64f1e30927c219853fc1

set SCIPY_DOWNLOAD="http://sourceforge.net/projects/scipy/files/scipy/0.13.3/scipy-0.13.3-win32-superpack-python2.7.exe"
set SCIPY_FILE=scipy-0.13.3-win32-superpack-python2.7.exe
set SCIPY_FILE_NOSSE=scipy-0.13.3-nosse.exe
set SCIPY_ZIP_MD5=ab43e3022aa642bef49a1f92516a6fdf

set PYWIN32_DOWNLOAD="http://sourceforge.net/projects/pywin32/files/pywin32/Build 218/pywin32-218.win32-py2.7.exe"
set PYWIN32_FILE=pywin32-218.win32-py2.7.exe
set PYWIN32_MD5=16e178ac18b49fa0d27ba0be90f460af

set NETWORKX_DOWNLOAD="http://networkx.lanl.gov/download/networkx/networkx-1.7-py2.7.egg"
set NETWORKX_FILE=networkx-1.7-py2.7.egg
set NETWORKX_MD5=1d4c59f1e894f39f8928be8718905969

set DJANGO_DOWNLOAD="https://pypi.python.org/packages/source/D/Django/Django-1.6.2.tar.gz"
set DJANGO_FILE=Django-1.6.2.tar.gz
set DJANGO_FILE_TAR=Django-1.6.2.tar
set DJANGO_MD5=45d974c623b3bfbf9976f3d808fe1ee9

set PIL_DOWNLOAD="http://effbot.org/downloads/PIL-1.1.7.win32-py2.7.exe"
set PIL_FILE=PIL-1.1.7.win32-py2.7.exe

set PY2EXE_DOWNLOAD="http://sourceforge.net/projects/py2exe/files/py2exe/0.6.9/py2exe-0.6.9.win32-py2.7.exe"
set PY2EXE_FILE=py2exe-0.6.9.win32-py2.7.exe
set PY2EXE_MD5=b7899302e70596defe3b7e8c95cd15c1

set WXPYTHON_DOWNLOAD="http://sourceforge.net/projects/wxpython/files/wxPython/3.0.0.0/wxPython3.0-win32-3.0.0.0-py27.exe"
set WXPYTHON_FILE=wxPython3.0-win32-3.0.0.0-py27.exe
set WXPYTHON_MD5=37b0b48483cf8f26d05fe152d60c214a

set MATPLOTLIB_DOWNLOAD="http://sourceforge.net/projects/matplotlib/files/matplotlib/matplotlib-1.3.1/matplotlib-1.3.1.win32-py2.7.exe"
set MATPLOTLIB_FILE=matplotlib-1.3.1.win32-py2.7.exe
set MATPLOTLIB_MD5=08953f7c4b2ddd7c233b0e42db51f13a

set DATEUTIL_DOWNLOAD="https://pypi.python.org/packages/source/p/python-dateutil/python-dateutil-2.2.tar.gz"
set DATEUTIL_FILE=python-dateutil-2.2.tar.gz
set DATEUTIL_FILE_TAR=python-dateutil-2.2.tar
set DATEUTIL_MD5=c1f654d0ff7e33999380a8ba9783fd5c

set PYPARSING_DOWNLOAD="https://pypi.python.org/packages/any/p/pyparsing/pyparsing-2.0.1.win32-py2.7.exe"
set PYPARSING_FILE=pyparsing-2.0.1.win32-py2.7.exe
set PYPARSING_MD5=e312e220208383c0b87f3c36996cf47a

set LXML_DOWNLOAD="https://pypi.python.org/packages/2.7/l/lxml/lxml-3.3.4.win32-py2.7.exe"
set LXML_FILE=lxml-3.3.4.win32-py2.7.exe
set LXML_MD5=55384beefb503549675f752697c2095f

set PY_SERIAL_DOWNLOAD="http://sourceforge.net/projects/pyserial/files/pyserial/2.7/pyserial-2.7.win32.exe"
set PY_SERIAL_FILE=pyserial-2.7.win32.exe
set PY_SERIAL_MD5=21555387937eeb79126cde25abee4b35

set PYODBC_DOWNLOAD="http://pyodbc.googlecode.com/files/pyodbc-3.0.7.win32-py2.7.exe"
set PYODBC_FILE=pyodbc-3.0.7.win32-py2.7.exe
set PYODBC_SHA1=e1992fe4d4983f16e33913e8162f89f50fcde2b0

set PYGAME_DOWNLOAD="http://pygame.org/ftp/pygame-1.9.1.win32-py2.7.msi"
set PYGAME_FILE=pygame-1.9.1.win32-py2.7.msi

set PYGTK_DOWNLOAD="http://ftp.gnome.org/pub/GNOME/binaries/win32/pygtk/2.24/pygtk-all-in-one-2.24.2.win32-py2.7.msi"
set PYGTK_FILE=pygtk-all-in-one-2.24.2.win32-py2.7.msi
set PYGTK_MD5=4bddf847f81d8de2d73048b113da3dd5

set PYQT_DOWNLOAD="http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.10.4/PyQt4-4.10.4-gpl-Py2.7-Qt4.8.5-x32.exe"
set PYQT_FILE=PyQt4-4.10.4-gpl-Py2.7-Qt4.8.5-x32.exe
set PYQT_MD5=4dbba5c9920a5fa5311c294d5975b65f

set IPYTHON_DOWNLOAD="https://pypi.python.org/packages/source/i/ipython/ipython-1.2.1.zip"
set IPYTHON_FILE=ipython-1.2.1.zip
set IPYTHON_MD5=a4b36d55e2671c6e821018a63d50b8b1

set PANDAS_DOWNLOAD="https://pypi.python.org/packages/2.7/p/pandas/pandas-0.11.0.win32-py2.7.exe"
set PANDAS_FILE=pandas-0.11.0.win32-py2.7.exe
set PANDAS_MD5=aaefa25cc5042f0408834f4d1f74ed10

set SIX_DOWNLOAD="https://pypi.python.org/packages/source/s/six/six-1.6.1.tar.gz"
set SIX_FILE=six-1.6.1.tar.gz
set SIX_FILE_TAR=six-1.6.1.tar
set SIX_MD5=07d606ac08595d795bf926cc9985674f

set XLRD_DOWNLOAD="https://pypi.python.org/packages/source/x/xlrd/xlrd-0.9.2.tar.gz"
set XLRD_FILE=xlrd-0.9.2.tar.gz
set XLRD_FILE_TAR=xlrd-0.9.2.tar
set XLRD_MD5=91a81ee76233e9f3115acaaa1b251b0e

set XLWT_DOWNLOAD="https://pypi.python.org/packages/source/x/xlwt/xlwt-0.7.5.tar.gz"
set XLWT_FILE=xlwt-0.7.5.tar.gz
set XLWT_FILE_TAR=xlwt-0.7.5.tar
set XLWT_MD5=59cb5efd55319465dfcd25e6a485f03c

set XLUTILS_DOWNLOAD="https://pypi.python.org/packages/source/x/xlutils/xlutils-1.7.0.tar.gz"
set XLUTILS_FILE=xlutils-1.7.0.tar.gz
set XLUTILS_FILE_TAR=xlutils-1.7.0.tar
set XLUTILS_MD5=4dfeb7be1929c187252a6ebd03076009

set OPENPYXL_DOWNLOAD="https://pypi.python.org/packages/source/o/openpyxl/openpyxl-1.8.5.tar.gz"
set OPENPYXL_FILE=openpyxl-1.8.5.tar.gz
set OPENPYXL_FILE_TAR=openpyxl-1.8.5.tar
set OPENPYXL_MD5=6f2eca608c3129dbfd77982713565709

set PYCHARM_DOWNLOAD="http://download-cf.jetbrains.com/python/pycharm-community-3.1.2.exe"
set PYCHARM_FILE=pycharm-community-3.1.2.exe
set PYCHARM_MD5=4707668758b044bf5a4214557e7a15fa
