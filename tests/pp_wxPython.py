#!/usr/bin/env python
# -*- coding: utf-8 -*-

#-MetaData.-------------------------------------------------------------------
__doc__ = """
Test App for Portable Python wxPython package.
==============================================

Simply for making sure most basic things are working in real runtime.
Just slap a bunch of widgets into it and call it. Did it fire up?

The original wxPy3.0 builds for MSW where borked and had compiled issues.
Ex: The wxPy demo had various problems with widgets.

A runnable wxSanity test.

"""
__author__ = "Metallicow"
__license__ = "wxWidgets/wxPython"


#-Imports.--------------------------------------------------------------------
#--Python Imports.
import os
import sys
import keyword

#--wxPython Imports.
import wx
import wx.lib.agw.aui as aui
import wx.py as py
import wx.stc as stc
from wx.lib.embeddedimage import PyEmbeddedImage

# Change cwd the tests directory so we can access images/etc.
os.chdir(os.path.abspath(os.path.dirname(__file__)))
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))

#-Globals.--------------------------------------------------------------------
# Optimized png.
portablepython = PyEmbeddedImage(
    "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"
    "rkJggg==")


class MyPanel(wx.Panel):
    """Test panel"""
    def __init__(self, parent, id=wx.ID_ANY,
                 pos=wx.DefaultPosition, size=wx.DefaultSize,
                 style=wx.BORDER_SUNKEN, name='panel'):
        """Default class contructor."""
        wx.Panel.__init__(self, parent, id, pos, size, style, name)

        self.splitter = wx.SplitterWindow(self)

        self.splitter.notebook = nb = aui.AuiNotebook(self.splitter)
        self.splitter.pycrust = py.crust.Crust(self.splitter)
        pyshellSTC = self.splitter.pycrust.shell
        emb_bmp = portablepython.GetBitmap()
        bmp = wx.Bitmap('portablepython.png', wx.BITMAP_TYPE_PNG)
        self.splitter.SetMinimumPaneSize(50)
        self.splitter.SplitHorizontally(self.splitter.notebook,
                                        self.splitter.pycrust,
                                        parent.GetSize()[1] // 2)

        vbSizer = wx.BoxSizer(wx.VERTICAL)
        vbSizer.Add(self.splitter, 1, wx.EXPAND | wx.ALL, 5)
        self.SetSizer(vbSizer)

        for i, widget in enumerate((
                    wx.Button, wx.Choice, wx.ComboBox, wx.Gauge,
                    wx.ListBox, wx.ListCtrl, wx.RadioButton,
                    wx.SearchCtrl, wx.Slider, wx.SpinCtrl, wx.TreeCtrl
                    )):
            pnl = wx.Panel(nb)
            pnl.widget = widget(pnl)
            pnl.staticText = wx.StaticText(pnl, wx.ID_ANY,
                                    '%s' % pnl.widget.__class__.__name__)
            szr = wx.BoxSizer(wx.VERTICAL)
            szr.Add(pnl.staticText, 0, wx.EXPAND | wx.ALL, 5)
            szr.Add(pnl.widget, 1, wx.EXPAND | wx.ALL, 5)
            pnl.SetSizer(szr)
            nb.AddPage(pnl, 'page %d' % int(i + 2))

        from this import s as obfuscate
        from this import d as data_structure
        balance = "".join([data_structure.get(c, c) for c in obfuscate])
        thisCtrl = wx.TextCtrl(self.splitter.pycrust.notebook, wx.ID_ANY,
                               balance, style=wx.TE_MULTILINE)
        self.splitter.pycrust.notebook.AddPage(thisCtrl, 'Balance')

        # Lets add the code.
        pnl = wx.Panel(nb)
        pnl.widget = codeSTC = stc.StyledTextCtrl(pnl)
        self.CopyStyledTextCtrlStyling(pyshellSTC, pnl.widget)
        codeSTC.SetLexer(stc.STC_LEX_PYTHON)
        codeSTC.SetKeyWords(0, " ".join(keyword.kwlist))
        codeSTC.SetProperty("fold", "1")
        codeSTC.SetProperty("tab.timmy.whinge.level", "1")
        codeSTC.SetViewEOL(True)
        codeSTC.SetViewWhiteSpace(stc.STC_WS_VISIBLEALWAYS)
        codeSTC.SetEdgeMode(stc.STC_EDGE_LINE)
        codeSTC.SetEdgeColumn(78)
        codeSTC.SetMarginType(1, stc.STC_MARGIN_NUMBER)
        codeSTC.SetMarginWidth(1, 32)
        codeSTC.SetMarginType(2, stc.STC_MARGIN_SYMBOL)
        codeSTC.SetMarginMask(2, stc.STC_MASK_FOLDERS)
        codeSTC.SetMarginSensitive(2, True)
        codeSTC.SetMarginWidth(2, 12)
        codeSTC.MarkerDefine(stc.STC_MARKNUM_FOLDEROPEN,
                             stc.STC_MARK_ARROWDOWN, "black", "black")
        codeSTC.MarkerDefine(stc.STC_MARKNUM_FOLDER,
                             stc.STC_MARK_ARROW, "black", "black")
        codeSTC.MarkerDefine(stc.STC_MARKNUM_FOLDERSUB,
                             stc.STC_MARK_EMPTY, "black", "black")
        codeSTC.MarkerDefine(stc.STC_MARKNUM_FOLDERTAIL,
                             stc.STC_MARK_EMPTY, "black", "black")
        codeSTC.MarkerDefine(stc.STC_MARKNUM_FOLDEREND,
                             stc.STC_MARK_EMPTY, "white", "black")
        codeSTC.MarkerDefine(stc.STC_MARKNUM_FOLDEROPENMID,
                             stc.STC_MARK_EMPTY, "white", "black")
        codeSTC.MarkerDefine(stc.STC_MARKNUM_FOLDERMIDTAIL,
                             stc.STC_MARK_EMPTY, "white", "black")
        codeSTC.Bind(stc.EVT_STC_MARGINCLICK, self.OnMarginClick)
        codeSTC.SetText(open(__file__).read())
        pnl.staticText = wx.StaticText(pnl, wx.ID_ANY,
                                '%s' % pnl.widget.__class__.__name__)
        szrV = wx.BoxSizer(wx.VERTICAL)
        szrV.Add(pnl.staticText, 0, wx.EXPAND | wx.ALL, 5)
        szrV.Add(pnl.widget, 1, wx.EXPAND | wx.ALL, 5)
        pnl.SetSizer(szrV)
        nb.InsertPage(0, pnl, 'code')
        nb.SetSelection(0)

        # Lets add an image page to link back to the code page.
        self.win = wx.Window(nb)
        self.win.bmp = wx.StaticBitmap(self.win, wx.ID_ANY, emb_bmp,
                                       pos=(emb_bmp.GetWidth() // 2,
                                            emb_bmp.GetHeight() // 2),
                                       style=wx.BORDER_SUNKEN)
        self.win.bmp.SetToolTip(wx.ToolTip('Fork me on GitHub!'))
        if 'phoenix' in wx.version():
            self.paintBrush = wx.Brush(emb_bmp)
        else:
            self.paintBrush = wx.BrushFromBitmap(bmp)
        self.win.Bind(wx.EVT_SIZE, self.OnSize)
        self.win.Bind(wx.EVT_ERASE_BACKGROUND, self.OnEraseBackground)
        self.win.Bind(wx.EVT_PAINT, self.OnPaint)
        self.win.bmp.Bind(wx.EVT_LEFT_DOWN,
                          self.OnLeftDown_ForkMeOnGitHub_PPImage)
        nb.InsertPage(1, self.win, 'Portable Python on GitHub')

    def OnSize(self, event):
        """
        Handle the ``wx.EVT_SIZE`` event.

        :param `event`: A `wx.SizeEvent` to be processed.
        """
        self.win.Refresh()

    def OnEraseBackground(self, event):
        """
        Handle the ``wx.EVT_ERASE_BACKGROUND`` event.

        :param `event`: A `wx.EraseEvent` to be processed.
        """
        pass # Reduce flicker with BufferedPaint.

    def OnPaint(self, event):
        """
        Handle the ``wx.EVT_PAINT`` event.

        Paint me a pretty picture.

        :param `event`: A `wx.PaintEvent` to be processed.
        """
        dc = wx.BufferedPaintDC(self.win)
        dc.SetBrush(self.paintBrush)
        dc.Clear()
        dc.DrawRectangle(0, 0, self.win.Size[0], self.win.Size[1])

    def OnLeftDown_ForkMeOnGitHub_PPImage(self, event):
        """Visit Portable Python @ GitHub on the Web."""
        import webbrowser
        url = 'https://github.com/pericazivkovic/portablepython'
        webbrowser.open_new_tab(url)

    def OnMarginClick(self, event):
        """Handle the ``wx.stc.EVT_STC_MARGINCLICK`` event."""
        codeSTC = event.GetEventObject()
        lineClicked = codeSTC.LineFromPosition(event.GetPosition())
        codeSTC.ToggleFold(lineClicked)

    def CopyStyledTextCtrlStyling(self, stcToMimic, stcToStyle):
        """Imitation is the sincerest form of flattery."""
        stc1, stc2 = stcToMimic, stcToStyle
        for i in dir(stc):
            if i.startswith(('STC_P_', 'STC_STYLE_')):
                sty = eval('stc.%s' % i)
                stc2.StyleSetBackground(sty, stc1.StyleGetBackground(sty))
                stc2.StyleSetBold(sty, stc1.StyleGetBold(sty))
                stc2.StyleSetCase(sty, stc1.StyleGetCase(sty))
                stc2.StyleSetChangeable(sty, stc1.StyleGetChangeable(sty))
                stc2.StyleSetCharacterSet(sty, stc1.StyleGetCharacterSet(sty))
                stc2.StyleSetEOLFilled(sty, stc1.StyleGetEOLFilled(sty))
                stc2.StyleSetFaceName(sty, stc1.StyleGetFaceName(sty))
                stc2.StyleSetFont(sty, stc1.StyleGetFont(sty))
                stc2.StyleSetForeground(sty, stc1.StyleGetForeground(sty))
                stc2.StyleSetHotSpot(sty, stc1.StyleGetHotSpot(sty))
                stc2.StyleSetItalic(sty, stc1.StyleGetItalic(sty))
                stc2.StyleSetSize(sty, stc1.StyleGetSize(sty))
                stc2.StyleSetSizeFractional(sty,
                                            stc1.StyleGetSizeFractional(sty))
                stc2.StyleSetUnderline(sty, stc1.StyleGetUnderline(sty))
                stc2.StyleSetVisible(sty, stc1.StyleGetVisible(sty))
                stc2.StyleSetWeight(sty, stc1.StyleGetWeight(sty))
        # stc2.Colourise(0, stc2.GetLength())
        stc1.SetZoom(0)  # Zoom goes small for some odd reason. Fix it.


class MyFrame(wx.Frame):
    """Test Frame"""
    def __init__(self, parent, id=wx.ID_ANY, title=wx.EmptyString,
                 pos=wx.DefaultPosition, size=wx.DefaultSize,
                 style=wx.DEFAULT_FRAME_STYLE, name='frame'):
        """Default class contructor."""
        wx.Frame.__init__(self, parent, id, title, pos, size, style, name)
        global gMainWin
        gMainWin = self
        panel = MyPanel(self)
        self.CreateStatusBar(2)
        self.SetStatusText('wxPython %s' % wx.version(), 0)
        self.SetStatusText('Python %d.%d.%d.%s' % sys.version_info[0:4] +
                           ' @ ' + '%s' % sys.executable, 1)
        self.Bind(wx.EVT_CLOSE, self.OnDestroy)

    def OnDestroy(self, event):
        """
        Handle the ``wx.EVT_CLOSE`` event for :class:`MyFrame`.

        :param `event`: A `wx.CloseEvent` to be processed.
        """
        self.Destroy()


class PortablePythonTestApp(wx.App):
    """Test App"""
    def OnInit(self):
        """Initialize."""
        self.SetClassName('PortablePythonTestApp')
        self.SetAppName('PortablePythonTestApp')
        dSzX, dSzY = wx.GetDisplaySize()
        gMainWin = MyFrame(None, size=(dSzX // 2, dSzY // 2))
        gMainWin.SetTitle('PortablePython Test App')
        self.SetTopWindow(gMainWin)
        gMainWin.Centre()
        gMainWin.Show()
        return True


if __name__ == '__main__':
    gApp = PortablePythonTestApp(redirect=False,
            filename=None,
            useBestVisual=False,
            clearSigInt=True)

    gApp.MainLoop()
