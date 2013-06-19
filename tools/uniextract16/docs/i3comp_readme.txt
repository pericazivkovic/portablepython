InstallShield File Compressor
Version 3.00.062 for Microsoft Windows 95
Usage: Compress path\input path\output [pathinlib] -Options
where
  input/output - can include wildcard characters
  path         - absolute and current paths are supported, not relative path.
  pathinlib    - file path in the compresssed library.
  Options:
    -c  (Default) Compress source files.
    -d  Decompress files in the compressed library.
    -dt Decompression Test mode.
    -h  Hide the percent complete bar.
    -i  Include subdirectories.
    -l  List files compressed in 'output'.
    -o  Overwrite all files without asking.
    -ox Overwrite based on newer date/time only.
    -r  Remove files from the compresssed library.
    -sh (Default) Highest compression.
    -sl Highest speed, lowest compression.
    -sm Medium compression.
    -sn No compression.  Data will not be compressed in this mode.

Compression Examples:
---------------------
Example 1:
To compress all the files in the c:\windows directory.
      ICOMP c:\windows\*.* win.z

Example 2:
To compress all files in c:\windows directory, including sub directories.
      ICOMP c:\windows\*.* win.z -i

Example 3:
To compress files in c:\myapp\bin (including sub directories) to the BIN
sub directory of an existing compressed library, myapp.z.
      ICOMP c:\myapp\bin\*.* myapp.z BIN -i

Decompression Examples:
-----------------------
Example 1:
To decompress all the files (sub directories not included) from myapp.z to
the current directory.
      ICOMP myapp.z *.* -d

Example 2:
To decompress all files (including sub directories) from myapp.z to
the current directory.
      ICOMP myapp.z *.* -d -i

Example 3:
To decompress all files (including sub directories) from myapp.z to c:\myapp.
      ICOMP myapp.z c:\myapp\*.* -d -i

Example 4:
To decompress all files (including sub directories) in the BIN directory
of myapp.z to c:\myapp\bin.
