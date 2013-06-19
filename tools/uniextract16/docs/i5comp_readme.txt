                    i5comp v2.01 Release Notes
                    ~~~~~~~~~~~~~~~~~~~~~~~~~~
       (InstallShield v5.x Compression and Maintenance util)
                     -] fOSSiL - Aug-24-1999 [-


	1. INTRODUCTION
	2. INSTALLATION
	3. CONCEPTS
	4. UNSUPPORTED
	5. THAT'S IT


1. INTRODUCTION
---------------
   Under pressure from many users I have decided to update this util to
support newer InstallShield v5.5+ cabinets. I cannot guarantee support
and continuing updates since my free time is running low now.

   As u probably know, v1.0 could not handle v5.5+ cabinets. This was
due to the fact that new InstallShield cabinets come split into 2 files-
.HDR (header file) and .CAB (data file). And of course, while fixing that
I found a couple of minor structure changes and a few bugs (yeah, those :)

   ZD*.DLL files are still the same old ones - InstallShield Corp. has
finally decided to stick with their current compression libs :)

Changes/New features are:

- Added AutoDetect for cabinet version (yay!)
  It is no longer necessary to specify -v in most cases, only if
  autodetect fails for some reason

- New option -o: suppresses any extra output, like comments, start msg
  (easier to make wrappers/GUI)
  Please note, that it will not suppress error and warning messages

- New option -f: treat File Groups as directories
  Now u can use it instead of -g and specify filegroup name as u would
  specify a folder, i.e.:

	i5comp a -f data1.cab "English Intel 32 Files" *.dll
	  (this will add all .dll files in the current dir to the
	   filegroup "English Intel 32 Files" in data1.cab)
     or
	i5comp a -r -f data1.cab "English Intel 32 Files\Lalala\*"
	  (this will add all files and subdirs starting from the
	  "English Intel 32 Files\Lalala" directory to the subdir
	  Lalala inside filegroup "English Intel 32 Files" in data1.cab)

  Other variants are possible too.
  This option was really intended for use with Far MultiArc plugin,
  see the next item ;)

- Far MultiArc plugin script
  U can now use Far to browse IS cabinets and do some basic operations.
  There are some limitations of course - MultiArc cannot add files to
  a subdir inside an archive, so u have to work around by adding whole
  directories to the root of a cabinet, which is a list of File Groups ;)
  Please look at the attached Far-Arc.txt file for more details

- Changed format of listings: mostly extended Size fields
  (uhm, files are getting bigger now, need more space ;)

- Source code is now included with this version. You are welcome to make
  changes and recompile, the only thing I will ask is that u update the
  version to something like 2.<YourNick>.x in the start message :).

     Other than that - RTFM !


2. INSTALLATION
---------------
   1) Put 'i5comp.exe' wherever u want (preferrably somewhere in PATH).
   2) Put 'zd*.dll' files in %WinSysDir%. For example, on Win95 that
      might be 'C:\WINDOWS\SYSTEM' and on NT - 'C:\WINNT40\SYSTEM32'.
      Or u can put these files anywhere in PATH.


3. CONCEPTS
-----------
   1) COMMAND SYNTAX
   Unlike weird icomp.exe, i5comp mimics the command syntax of ARJ/RAR
style compressors, but the big difference is that the established syntax
order can not be broken, meaning that u have to specify <cmd> [-opts] <cab>
in this order, no mixing is allowed.
   Just run i5comp with no parameters to see the explanation of syntax,
commands and options.

   2) FILE INDEX
   Every file inside a cab has a fixed index. U can see that index when u
do 'i5comp l your.cab' in the 'Ind' column. InstallShield allows duplicate
filenames within one cab, so u might have to referr to the file by its
index to ensure that u extract/replace the right one.

   3) MASK MATCHING
   In addition to the references to files by name and index u can use
filemasks ('fmask' for short in the command line help). The mask matching in
i5comp is extended compared to standard DOS one. U can use, for example,
masks like this : a*b.dll, *b?c?d*.d*, etc. For example, '*b?c*.dll' will
match with 'boc.dll', 'bac12.dll', 'aablc.dll', but will NOT match 'bc.dll'.

   4) FILEGROUPS
   Every file inside a cab belongs to some FileGroup. Because of this
structure, u have to specify a FileGroup with a -g option when adding files
to a cab. Alternatively, u cab use -f mode of i5comp, in which FileGroups
are treated as directories.

   5) COMPRESSION DLLs
   Somewhere in the middle of the development of versions 5.x InstallShield
changed the way the files are being compressed. Because of that the option -v
was created. It allows u to specify which version of compression dll to use.
This version includes a version AutoDetection feature, which is not entirely
fool-proof, so in case it fails use -v.

   NOTE: U *MUST* be completely sure u are using the right version when
adding/replacing files in a cab, otherwise the installation may fail. By
default, i5comp will use the dll from v5.10.145 which is compatible with
v5.00.200 and above. To ensure u are using the right one, look at the
ZDATA5x.DLL that came with the installation u are screwing with and specify
-v<n> afterwards ;)


4. UNSUPPORTED
--------------
   1) Multi-volume cabinets with the first volume blank are not supported and
will not convert to a single volume. Coding support for this is *relatively*
easy - u can do it on your own.

   2) CAB creation functionality was never intended and required too much
effort, especially since u can create CABs with InstallShield itself.


5. THAT'S IT
------------
U are probably already bored to death, so I will be brief.
Thanx to all who took interest in my util and helped with fixing bugs.

BETA TESTERS : Domnar, G-RoM, Jacky
~~~~~~~~~~~~~~

GREETZ go to : Acpizer, Animadei, bK, BlackMage, Cooly, Crypto, Cybr Wolf,
~~~~~~~~~~~~~~ Devil, djHD, Domnar, Ducky, Ghiribizzo, G-RoM, Groo, Ice,
               Jacky, John Astig, Junior Mafia, Krk, MtD, MustDie, Karnage,
               LiuTaoTao, LordByte, Marquis, Muffin, Pain, The Owl, Quine,
               Razzi, Saint Tok, Sensi, Stone, Xoanon
