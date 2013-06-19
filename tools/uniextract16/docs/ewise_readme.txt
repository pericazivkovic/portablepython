user documentation            E_WISE                      Veit Kannegieser
ננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננ

usage:
ÍÍÍÍÍÍ
  E_WISE <WISE-Setup-EXE> <target directory>

example:
  E_WISE M:\SETUP.EXE E:\TEST

The idea for E_WISE comes from EXWISE / Andrew de Quincey
(adq@tardis.ed.ac.uk, http://www.tardis.ed.ac.uk/~adq).

my version
 - reimplemented in Pascal
 - can handle more WISE-versions
 - can retrive filenames and date/time

after program usage you will find in target directory:
 - ????????.EWI: unpacked data
 - 00000000.TXT: reference of ????????.EWI and quessed filename
 - 00000000.BAT, (DOS)  \ to rename ????????.EWI
   00000000.CMD: (OS/2) / and move to subdirectories


problems:
ÍÍÍÍÍÍÍÍÍ

 * HPFS filesystem recommended (long file/directory names)

 * thhere exist packages where one filename is used multiple times
   (example: multilingual README.TXT)

 * if you want unpack an executable sliced onto muliple diskettes
   you must rebuild one singe file for E_WISE:

   copy A:\setup.exe s.exe
   copy /b s.exe + A:\setup.w01
   copy /b s.exe + A:\setup.w02

   and then unpack
   e_wise s.exe x\
   
Frequently asked question: Can you help me making an setup.exe from unpacked
files ? The problem is not the compression procedure (zip/inflate), but the
data format of the directory file. It differs each version. And i do not
want my time spend for an user unfriendly archive format/target platform.


changes:
ÍÍÍÍÍÍÍÍ
 נ 2000.02.11..2000.02.29
 ‏ processing of version NE/$3e10 added
 ‏ processing of version NE/$3bd0 and NE/$3c10 added
 ‏ Support for selfextracing selfextractors ..
 ‏ improved filename recognition
 נ 2000.03.01
 ‏ corrected PE/$6e00with relocations
 נ 2000.08.21
 ‏ processing of version NE/$3770 added
 ‏ accept readonly files
 נ 2000.10.12
 ‏ corrected missing zeroes in last packed file
 נ 2002.02.11
 ‏ added NE/$84b0, use /DEBUG to bypass bad blocks
  נ 2002.03.26
 ‏ added NE/$3c20
 נ 2002.03.29
 ‏ added PE/6e00;$3d04
 ‏ reads known formats from e_wise.ini 
 נ 2002.07.01
 ‏ protect "&" char in filenames
 ‏ NE/37B0
 ‏ added partial support for patch format
 ‏ append numbers to equal filenames
 