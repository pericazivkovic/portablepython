Notes for ARC 5.21e					October 31, 1991

	ARC 5.21 for Unix is currently at patch level 6. The code provided
here has been used on 4.3 BSD based Unix systems and on the Atari ST. (The
GNU C compiler, version 1.40, was used to make the ST version. It should
still compile with Mark Williams C, but I haven't bothered to try it.) The
current version is over twice as fast as previous releases, for all file
compression and decompression operations. It also fixes longstanding bugs
in the squash code and in the tmclock DST code.
 
	The Arcinfo file describes the ARC 5.xx directory format. The 6.xx
format contains additional information that is not supported here.

	System V support in the shar file Sysvarcstuf was provided by Jon
Zeeff, Janet Walz, and Rich Salz. You will probably also need the dirent
directory library written by Doug Gwyn; this can be obtained from uunet or
many other comp.sources.unix archive sites.

	The tmclock.c file was stolen from Jef Poskanzer's tws library,
as distributed in PHOON, PHase of the mOON, and slightly hacked by me.

	The man page was originally from Leo Wilson, with updates by me.

         /                 Howard Chu
   ___  /_ , ,_.     Jet Propulsion Laboratory
       / /(_/(__     hyc@hanauma.jpl.nasa.gov
           /

Notes for ARC 5.21                                        June 6, 1988
 
This program is based on the MSDOS ARC program, version 5.21, plus
a few enhancements... 
 
 o ARC also performs Huffman Squeezing on data. The Huffman Squeeze
   algorithm was removed from MSDOS ARC after version 5.12. It turns
   out to be more efficient than Lempel-Ziv style compression when
   compressing graphic images. Squeeze analysis is always done now,
   and the best of packing, squeezing, or crunching is used.
 
 o Compresses and extracts Squashed files. "Squashing" was created
   by Phil Katz in his PKxxx series of ARC utility programs for
   MSDOS. Dan Lanciani wrote the original modifications to ARC's
   Crunch code to handle Squashing. I've made minor changes since
   then, mostly to reduce the amount of memory required. The 'q'
   option flag must be specified to Squash files. The Squashing
   algorithm will be used instead of the usual Crunch algorithm,
   and will be compared against packing and squeezing, as before.
 
System specific notes:
 
   On MTS, an additional option flag, 'i' for "image mode," was
used. ARC assumes files are text, by default, and will translate
MTS files from EBCDIC to ASCII before storing in an archive, and
translates from ASCII to EBCDIC upon extraction. Specifying the
'i' flag will inhibit this translation. This would most commonly
be used when shipping binary images such as TeX DVI files, other
.ARC files stored within an archive, etc... The 'r' (run) command
is omitted. It just doesn't seem very useful. Also, ARC cannot
restore MTS files with their original time stamps. (Maybe in a
future release...)
 
   On Unix(tm) systems, the 'i' flag is also present. Unix ARC
assumes a binary file, by default. Here the only translation
involved is in end-of-line processing. When storing text files, ARC will
change '\n' to '\r\n', and does the opposite when extracting files.
Carriage returns in any other location are preserved when extracting.
This translation only occurs if the 'i' flag is given.

   On the Atari ST, the 'h' (for "hold screen") option is present,
which simply delays exiting the program. This is typically used when
executing ARC from the desktop, to allow reading all of ARC's output
before the screen is cleared and the desktop is redrawn. The program
will prompt and wait for a keypress before exiting. Note that since
there are no "options" for the MARC program, the "hold screen" option
is always active for MARC.
 
   On both Unix and Atari systems, ARC & MARC will search for an
environment variable named "ARCTEMP" or "TMPDIR." If present, any
temporary files will be created in the specified directory. This is
probably insignificant for Unix users, but can be handy on the Atari,
in combination with a RAMdisk. Highly recommended for floppy users.
(Unfortunately, you can only take advantage of this when running some
form of command shell that allows setting environment variables. Thus,
you won't see any speed gains when running from the desktop.)
 
That about covers things. The enclosed documentation is taken directly
from the MSDOS distribution of ARC. Unless specified differently here,
the programs behave indentically. Note that ARC521.DOC is identical to
ARC520.DOC - the differences between the two versions are described in
the file CHANGES.521.
 
Oh yeah - this program may be distributed freely so long as you don't
modify it in any way. You may not charge for distributing it. (Don't
feel bad, I can't charge for it either. }-) It'd be nice if you kept
this and the other enclosed doc files with it when distributing, but
I'm not going to make a fuss about it. Most people are so familiar
with the program by now that it wouldn't matter much anyway. You
should keep this README file around, so bug reports & such will find
their way back to me. (Bugs? What bugs? Nah, there aren't any bugs...)
 
         /                 Howard Chu
   ___  /_ , ,_.     University of Michigan
       / /(_/(__     hyc@umix.cc.umich.edu
           /                umix!hyc
          '     
