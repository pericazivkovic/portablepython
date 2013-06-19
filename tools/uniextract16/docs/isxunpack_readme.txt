____________________________________________________________________
:::::::::::::::::::::::::::::::::::::::::::::#####::::::::::::::::::
:::::::::::::::###::::::###::::::::::::::::::#####::::::####::::::##
::###########::####:::::###:::::::::#######::::###:::::::####::::###
:######::####:::####:::####::::::::####:###:::####::::::::###:::####
#######::####::::###::###::::::::::###::::::::###::####::::###:####:
:::#########::::::######:::::::::::####:::::::########::::########::
:::##########:::::####::::::::::::::#####:::::#####::::::#######::::
:::###::::####::::###:::::::::::::::::####:::######:::::#######:::::
:::###:::::###::::###::::::::::::#:::::###:::#############:###::::::
::####::::###::::####:::::::::::###::::###:::###:########::###::::::
::##########:::::###::::::::::::##########:::###:::####::::###::::::
::########:::::::::::::::::::::::#######::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::o6.o4.2oo4.::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	 InstallShield (by one exe-file) Unpacker v-0.99
	 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.some.theory
 ~~~~~~~~~~~
This tool unpacks two of three known modifications of InstallShield
Self-Extracting .EXE-files (like 3DMark03.exe).

_First modification is All-in-One. All files are stored one by one
in IS-Exe-container like this:
___________
data1.hdr
data1.cab
data2.cab
engine32.cab
layout.bin
setup.exe
setup.ini
setup.boot
~~~~~~~~~~~~
_Second modification is All-in-Cab. All files are stored in simple
Microsift Cabinet File (*.cab) in IS-Exe.

_Third modification is too hard for me to understand, but it's a
All-in-MSI (with some files to run *.msi like setup.ini and so on)
There are a litte bit of encryption (or compression?) in exe-file.
But after You run IS-Exe-file you can see in WinDir's Temp folder
unpacked *.Msi-file (Microsoft Installer) and you can dig it on
your own ;)

.how.to.use
 ~~~~~~~~~~
Use like that: is7unpack.exe 3DMark03.exe (for example)
Unpacked files should be unpacked in IsXunpack.exe's dir in Disk1
Folder.

.some.techs.aspect
 ~~~~~~~~~~~~~~~~~
This is a FULLY GENERIC IS (by One Exe-File) Unpacker!
Fill free and use it for exact modifications of IS files.

.about
 ~~~~~
CreateD bY Pit0n and SkYuS//vN (Russia, NewMsk)

.contact
 ~~~~~~~
For any bugs: pit0n2(at)mail.ru

.greetings
 ~~~~~~~~~
Volodya/WASM.RU - for help with IS stuff.





						That'z all folkz!
