Short:    UnLZX with new args (68k/PPC/i486)
Author:   Oliver Gantert <lucyg@t-online.de>
Uploader: Oliver Gantert <lucyg@t-online.de>
Version:  2.16 (14.11.2000)
Type:     util/arc

This is based on the UnLZX port by David Tritscher <dt14@uow.edu.au>
                           changed by <Andreas_Kleinert@t-online.de>

----------------------------------------------------------------------

I was tired of all those UnLZX ports which depack to the current dir
and don't support pattern-matching for output files.
So I had to do it...

Usage: UnLZX <options>

        -v <archive>  - view archive contents
        -x <archive>  - extract archive
        -o <path>     - depack to path
        -p <pattern>  - only depack matching files
                  NEW since 2.06: use Unix-like wildcards (*, ?)

New since the last release

  - when viewing an archive, the compression ratio is shown in percent
  - when extracting with pattern, only processed files are shown now
  - source change, slight speed increase

----------------------------------------------------------------------

This archive contains:

  (compiled with vbcc 0.7)
  UnLZX.000 - 68ooo version
  UnLZX.020 - 68o2o/o3o version
  UnLZX.040 - 68o4o/o6o version
  UnLZX.ELF - PPC / PowerUp version
  UnLZX.WOS - PPC / WarpOS version
  (compiled with lcc32)
  UnLZX.exe - i486 / Win95 version (older, but still working)
  src/      - Sources (GPL)
                                            Oliver Gantert, 14.11.2000
----------------------------------------------------------------------
