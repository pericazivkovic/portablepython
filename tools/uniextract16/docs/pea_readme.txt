[about]
PeaZip is an OS-portable file archiver; it supports it’s native
PEA archive format (featuring compression, splitting and flexible
encryption and integrity check schemes) and other mainstream formats,
with especial focus on handling open formats.
 - Full support: 7z, Bzip2, Gzip, PEA, Tar, Zip.
 - Browse/extract-only support: Z.

PeaZip doesn’t follow the Explorer-like interface paradigm; the UI
is more similar to a CD/DVD-burner application, allowing the user to:
 - save and restore layout of archives (input files and folders list)
   to speed up definition of archiving and backup operations;
 - save job definition as plain text, to be used in any script language;
 - have a detailed job log after each operation;

The interface is fully skinnable (skins can be customised and saved as
plain text to be re-edited as freely as possible) and uses customisable
transparency.
The program doesn’t need to be installed/unistalled, it can run from
any path (even remote; a writeable path is recommended), however Windows
version is released both as a standalone binary and as a fully automated
installer/uninstaller package, allowing tight system integration to use 
PeaZip right from Explorer from file association and "SendTo" menu.

For more information on PEA archive format and about PeaZip please refer
to official PeaZip site: http://sourceforge.net/projects/peazip/

Notes for developers:
PeaZip executables are developed to stay as platform independent as
possible and are tested under Win32 and Linux (Linux version requires 
libgdk_pixbuf library), compiled using FPC/Lazarus.
PeaZip binaries and sources are released under GNU LGPL, all related 
documentation is released under GNU GFDL. 
PEA file format and PCOMPRESS specifications are hereby released under
PUBLIC DOMAIN: the Author neither has, nor is aware of, any patents or
pending patents relevant to this technology and do not intend to apply
for any patents covering it. 
As far as the Author knows, PEA file format is free and unencumbered for
all uses.

Special thanks goes to:
- Wolfgang Ehrhardt who written and maintains a very good Delphi/Pascal 
  crypto library,   used in PeaZip and in PEA file format, you can find
  his works on: http://home.netsurf.de/wolfgang.ehrhardt/index.html
  please refer to Wolfgang Ehrhardt for all what concerns those units,
  (collected in "we"   path in PeaZip source package).
- Igor Pavlov for providing under LGPL license his excellent 7Zip archiver,
  used in PeaZip (as 7za standalone console executable) to support most of
  mainstream file formats, along with all people developing and mantaining
  POSIX version of 7Zip, p7Zip.
  Please refer to 7Zip/p7Zip Authors for all what concerns 7za binaries.
- All people on sci.crypt.* and comp.compression, for the useful answers
  and information provided during PEA format development.
- Wikipedia, for the quality of the articles and links provided.
- FreePascal and Lazarus teams, for developing and maintaining such a 
  good development environment and related documentation.
- Tango Desktop Project team, for releasing under Creative Commons 
  Attribution Share-Alike   license many very nice looking icons, used
  in PeaZip Interface.