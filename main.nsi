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


; Define verbose level and Python version that should be compiled
!verbose 2

; Include correct folder
!AddIncludeDir ${PP_TYPE}

!define WEBSITE "PortablePython.com"
!define VERSION "${PY_VERSION}.${PP_VERSION}"
!define APPNAME "Portable Python ${PP_TYPE} ${VERSION}"
!define OUTFILENAME "PortablePython${PP_TYPE}_${VERSION}.exe"
!define OUTFOLDER "${OUTPUT_FOLDER}"
!define SOURCESFOLDER "${SOURCES_FOLDER}"

;=== Program Details
Name "${APPNAME}"
OutFile "${OUTFOLDER}\${OUTFILENAME}"
Caption "${APPNAME}"
InstallDir "\${APPNAME}"
VIProductVersion "${VERSION}"
VIAddVersionKey ProductName "${APPNAME}"
VIAddVersionKey Comments "For additional details, visit ${WEBSITE}"
VIAddVersionKey CompanyName "PortablePython.com"
VIAddVersionKey LegalCopyright "Perica Zivkovic"
VIAddVersionKey FileDescription "${APPNAME}"
VIAddVersionKey FileVersion "${VERSION}"
VIAddVersionKey ProductVersion "${VERSION}"
VIAddVersionKey InternalName "${APPNAME}"
VIAddVersionKey LegalTrademarks "PortablePython.com - all rights reserved"
VIAddVersionKey OriginalFilename "${OUTFILENAME}"

; Runtime Switches
CRCCheck On
RequestExecutionLevel user
ShowInstDetails show

; Best Compression
SetCompress Auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize On

!verbose 0

; MUI 1.67 compatible ------
!include "MUI2.nsh"

!include Sections.nsh
!include LogicLib.nsh

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Components page 
!insertmacro MUI_PAGE_COMPONENTS
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_LINK "Donate and help this project - Portable Python"
!define MUI_FINISHPAGE_LINK_LOCATION "http://PortablePython.com/"
; Finish page
!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"
; MUI end ------

!verbose 2

; Include modules file for the selected version
!include modules.nsh
!include descriptions.nsh
