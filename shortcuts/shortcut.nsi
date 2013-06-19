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

!verbose 0
; **************************************************************************
; === Define constants ===
; **************************************************************************
!define VER 		${PY_VERSION}.${PP_VERSION}	; version of launcher
!define APPNAME 	"Portable Python"	; complete name of program
!include ${SHORTCUTNAME}.nsh

; **************************************************************************
; === Best Compression ===
; **************************************************************************
SetCompressor /SOLID lzma
SetCompressorDictSize 32

; **************************************************************************
; === Set version information ===
; **************************************************************************
Caption "${APPNAME}"
VIProductVersion "${VER}"
VIAddVersionKey ProductName "${APPNAME}"
VIAddVersionKey FileDescription "${APPNAME}"
VIAddVersionKey FileVersion "${VER}"
VIAddVersionKey ProductVersion "${VER}"
VIAddVersionKey InternalName "${APPNAME}"
VIAddVersionKey OriginalFilename "${SHORTCUTNAME}-Portable.exe"

; **************************************************************************
; === Includes ===
; **************************************************************************
!ifdef REGISTRY
!include "Registry.nsh"
!endif
!include TextFunc.nsh
!insertmacro GetParameters

; **************************************************************************
; === Runtime Switches ===
; **************************************************************************
WindowIcon Off
SilentInstall Silent
AutoCloseWindow True
RequestExecutionLevel user

; **************************************************************************
; === Set basic information ===
; **************************************************************************
Name "${APPNAME}"
OutFile "${SHORTCUTNAME}-Portable.exe"
Icon "${SHORTCUTNAME}.ico"

; **************************************************************************
; ==== Running ====
; **************************************************************************

Section "Main"
	Call CheckDirExe

	Call SplashLogo
	Call Launch
SectionEnd

; **************************************************************************
; ===Start ===
; **************************************************************************
Function CheckDirExe
	IfFileExists "$EXEDIR\${APPDIR}\${APPEXE}" +3
	MessageBox MB_OK|MB_ICONEXCLAMATION `${APPEXE} was not found in $EXEDIR\${APPDIR}`
	Abort
FunctionEnd

; **************************************************************************
; === Before Launching ===
; **************************************************************************
Function SplashLogo
    InitPluginsDir
	File /oname=$PLUGINSDIR\splash${PY_VERSION}.bmp "splash${PY_VERSION}.bmp"
	advsplash::show 1500 300 200 0xFF0000 $PLUGINSDIR\splash${PY_VERSION} ; advsplash::show Delay FadeIn FadeOut KeyColor FileName
	Pop $0
FunctionEnd

; **************************************************************************
; === Run Application ===
; **************************************************************************
Function Launch
	${GetParameters} $0 	; Read command line parameters

	ReadEnvStr $R0 "PYTHONPATH"  	; Read PYTHONPATH
	ReadEnvStr $R1 "PATH"			; Read PATH
	StrCpy $R0 '$EXEDIR\App;$R0'	; Append to PYTHONPATH
	StrCpy $R1 '$EXEDIR\App;$R1'	; Append to PATH
	StrCpy $R2 '$EXEDIR\App\Lib\ppp.py'	; Set Python prompt

	System::Call 'Kernel32::SetEnvironmentVariable(t "PYTHONPATH",t R0)i' 	; Set PYTHONPATH temporarily
	System::Call 'Kernel32::SetEnvironmentVariable(t "PATH",t R1)i'			; Set PATH temporarily
	System::Call 'Kernel32::SetEnvironmentVariable(t "PYTHONSTARTUP",t R2)i'			; Set Python prompt temporarily
		
	ExecWait "$\"$EXEDIR\${APPDIR}\${APPEXE}$\" ${APPSWITCH} $0" 	; EXEC app with parameters
FunctionEnd


