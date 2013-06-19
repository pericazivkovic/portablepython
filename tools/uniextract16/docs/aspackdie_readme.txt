AspackDie 1.41
--------------
by yoda
	
This is a small unpacker for PE files (EXE, DLL, ...) which got compressed by
any Aspack version since Aspack 2000. This includes:

- Aspack 2000
- Aspack 2001
- Aspack 2.1
- Aspack 2.11
- Aspack 2.11c/d
- Aspack 2.12
- Aspack 2.12a/b
- some unknown version

For files being compressed with an earlier Aspack version take UnAspack by
BiWeiGuo (protools.cjb.net).

Have a look at the source code for more information.

Please send me files which don't work after unpacking if they were compressed
by one of the supported version.

Known errors: - The unpacking process for DLLs fails if it imports at least one
                DLL that could not be located by the Win32 loader.
              - A resource rebuilder is missing. No time, no interest, optimization
                is not the aim of the project. Seems you've to paste the resources,
                residing in the rudimentary '.aspack' section after unpacking, by
                hand into the origional .rsrc section and adjust the resource
                directory items. Else resource hacker and friends will fuck up...sorry

Command line:   AspackDie [input file path] [output file path] [/NO_PROMPT]

                /NO_PROMPT	- skip any kind of user messages

Greetz:
avlis, phantasm, Stone, analyst, MackT, ELiCZ, Jeremy Collake, Perfx,
Daedalus, Snow Panther, Unknown One, DAEMON, Jibz, X-Lock, lalala...

HaVe PhUn !

yoda

E-mail: LordPE@gmx.net
Check:  y0da.cjb.net
