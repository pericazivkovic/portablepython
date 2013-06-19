                    i6comp v1.03beta Release Notes
                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       (InstallShield v6.x Compression and Maintenance util)
                     -] Morlac - Jul-20-2000 [-
	General exception bugfix -] DarkSoul - Jan-10-2002 [-

       (InstallShield v5.x Compression and Maintenance util)
                     -] fOSSiL - Jul-10-1999 [-


	1. INTRODUCTION
	2. INSTALLATION
	3. CONCEPTS
	4. UNSUPPORTED


1. INTRODUCTION
---------------
   This is a utility to handle version 6 of the InstallShield cabinet files.
   Its based on i5comp by -] fOSSiL [-, so, thank him first. Without his
   excellent work, this one would not exist.
   All features are present from i5comp. What changed was the data structures
   only. The decompression routines are handled in ZD51145.DLL.

   I hope that no body flames me for using the i5comp readme, but i suck big
   time when it comes to writting docs.

Changes/New features are:

- [DarkSoul] Added bugix to aviod general exceptions. Should now work
	     without errors on IS 6.3 cabinet files. I changed nothing else,
	     so don't ask me if you still get errors!

- [MORLAC] Converting multi-volume cabinets to a single one has been removed.
	   No longer needed. Adding a file is not tested and propably wont work.

- [MORLAC] Multi-Volume Cab's are supported. Cab's must be of the form:
		Data1.cab, Data2.cab, Data3.cab ...etc.
   This works in the case where all these files share the same Data1.hdr
   Of course, the name "Data" can be anyother like lw1.cab, lw2.cab...etc.
   :-)


- [MORLAC] Now -f works with commands e and x, i.e:

	i6comp x -f data1.cab (files are decompressed under File Groups
		and subdirs)
     or
	i6comp e -f data1.cab (files are decompressed into their File
		Group sub-directory)

- Added AutoDetect for cabinet version (yay!)
  It is no longer necessary to specify -v in most cases, only if
  autodetect fails for some reason

- New option -o: suppresses any extra output, like comments, start msg
  (easier to make wrappers/GUI)
  Please note, that it will not suppress error and warning messages

- New option -f: treat File Groups as directories
  Now u can use it instead of -g and specify filegroup name as u would
  specify a folder, i.e.:

	i6comp a -f data1.cab "English Intel 32 Files" *.dll
	  (this will add all .dll files in the current dir to the
	   filegroup "English Intel 32 Files" in data1.cab)
     or
	i6comp a -r -f data1.cab "English Intel 32 Files\Lalala\*"
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
   1) Put 'i6comp.exe' wherever u want (preferrably somewhere in PATH).
   2) Put 'zd*.dll' files in %WinSysDir%. For example, on Win95 that
      might be 'C:\WINDOWS\SYSTEM' and on NT - 'C:\WINNT40\SYSTEM32'.
      Or u can put these files anywhere in PATH.


3. CONCEPTS
-----------
   1) COMMAND SYNTAX
   Unlike weird icomp.exe, i6comp mimics the command syntax of ARJ/RAR
style compressors, but the big difference is that the established syntax
order can not be broken, meaning that u have to specify <cmd> [-opts] <cab>
in this order, no mixing is allowed.
   Just run i6comp with no parameters to see the explanation of syntax,
commands and options.

   2) FILE INDEX
   Every file inside a cab has a fixed index. U can see that index when u
do 'i6comp l your.cab' in the 'Ind' column. InstallShield allows duplicate
filenames within one cab, so u might have to referr to the file by its
index to ensure that u extract/replace the right one.

   3) MASK MATCHING
   In addition to the references to files by name and index u can use
filemasks ('fmask' for short in the command line help). The mask matching in
i6comp is extended compared to standard DOS one. U can use, for example,
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
With InstallShield ver 6, they changed the file structures inside the cabinet
but they did not change the way the files are compressed. 



4. UNSUPPORTED
--------------
   1) Compressed files that span more than one cabinet are not tested and i
      dont think they exist.

   2) CAB creation functionality was never intended and required too much
      effort, especially since u can create CABs with InstallShield itself.


BETA TESTERS : ;-b
~~~~~~~~~~~~~~

GREETZ go to : fOSSiL for his i5comp and the source code. 
~~~~~~~~~~~~~~ Iceman of romania. Nice guy.
               G-Rom and the ProcDump team. I wish they continue it.
               +HCU for what they tought me.
               And anyone that i forgot. Its 4:05am, time to sleep.