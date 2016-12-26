import unittest

class TestCoreSystem(unittest.TestCase):
	"""Test Python core and associated tools"""
	def test_python(self):
		import platform
		self.assertEqual(platform.python_version(), "2.7.10")

	def test_setuptools(self):
		import setuptools
		self.assertEqual(setuptools.__version__, "0.6c11")		

class TestModuleImports(unittest.TestCase):
	"""Simple set of tests for package imports in case of full installation"""
	def test_numpy(self):
		import numpy
		self.assertEqual(numpy.version.version, "1.8.1")

	def test_scipy(self):
		import scipy
		self.assertEqual(scipy.version.version, "0.13.3")

	def test_pywin32(self):
		import os
		import distutils.sysconfig

		pth = distutils.sysconfig.get_python_lib(plat_specific=1)
		ver = open(os.path.join(pth, "pywin32.version.txt")).read().strip()
		self.assertEqual(ver, "218")

	def test_networkx(self):
		import networkx
		self.assertEqual(networkx.__version__, "1.7")

	def test_django(self):
		import django
		self.assertEqual(django.get_version(), "1.6.2")

	def test_pil(self):
		import PIL.Image
		self.assertEqual(PIL.Image.VERSION, "1.1.7")

	def test_py2exe(self):
		import py2exe
		self.assertEqual(py2exe.__version__, "0.6.9")

	def test_wxpython(self):
		import wx
		self.assertEqual(wx.__version__, "3.0.0.0")

	def test_matplotlib(self):
		import matplotlib
		self.assertEqual(matplotlib.__version__, "1.3.1")

	def test_dateutil(self):
		import dateutil
		self.assertEqual(dateutil.__version__, "2.2")

	def test_pyparsing(self):
		import pyparsing
		self.assertEqual(pyparsing.__version__, "2.0.1")

	def test_lxml(self):
		from lxml import etree
		self.assertEqual(etree.LXML_VERSION, (3, 3, 4, 0))

	def test_pyserial(self):
		import serial
		self.assertEqual(serial.VERSION, "2.7")

	def test_pyodbc(self):
		import pyodbc
		self.assertEqual(pyodbc.version, "3.0.7")

	def test_pygame(self):
		import pygame
		self.assertEqual(pygame.__version__, "1.9.1release")

	def test_pygtk(self):
		import pygtk
		self.assertEqual(pygtk._get_available_versions().keys()[0], "2.0")

	def test_pyqt(self):
		from PyQt4 import QtCore
		self.assertEqual(QtCore.qVersion(), "4.8.5")

	def test_ipython(self):
		import IPython
		self.assertEqual(IPython.__version__, "1.2.1")

	def test_pandas(self):
		import pandas
		self.assertEqual(pandas.__version__, "0.11.0")

	def test_xlwt(self):
		import xlwt
		self.assertEqual(xlwt.__VERSION__, "0.7.5")

	def test_xlrd(self):
		import xlrd
		self.assertEqual(xlrd.__VERSION__, "0.9.2")

	def test_xlutils(self):
		import xlutils
		self.assertEqual(xlutils.__name__, "xlutils")

	def test_openpyxl(self):
		import openpyxl
		self.assertEqual(openpyxl.__version__, "1.8.5")

if __name__ == '__main__':
	unittest.main()