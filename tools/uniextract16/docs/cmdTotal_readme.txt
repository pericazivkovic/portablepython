KaKeeware cmdTotal is yet another upgrade to IETOTALX proggie.
http://www.kakeeware.com/i_ietotalx.php

This is a generic approach to make it possible to use any
Total Commander WCX packer plugins from a command line.

-- How to use? --
From a command line, run:
   cmdTotal [wcxPluginName] [option] [fileName] [targetDirectory]
    where:
      [wcxPluginName] - WCX plugin filename (path not needed if in the same directory)
      [option] - can be:
        l - to list the files
        t - to test the files
        x - to extract the files
      [fileName] - file you want to process
      [targetDirectory] - where to extract the files (default: _[fileName])

Examples:
    cmdTotal.exe InstExpl.wcx l WinPcap_3_1.exe             - to list the files inside the archive
    cmdTotal.exe InstExpl.wcx x WinPcap_3_1.exe             - to extract the files inside the archive to _WinPcap_3_1.exe directory
    cmdTotal.exe InstExpl.wcx x WinPcap_3_1.exe c:\unpacked - to extract the files inside the archive to c:\unpacked directory

-- Technical note --
There's a guard thread created at the beginning of the main routine that will kill the instance
of cmdTotal, if the main thread haven't finished its work after 300 seconds.

There's SEH handler added before calling the function that extracts the files to make sure
we extract as many of them as possible.

-- History --
 2006-12-31 v. 1.01 - added support for SetProcessDataProc (some plugins expect callback to be set) - (thx to perchwasamara for hint on that)
                    - fixed the way ProcessFile is called - some plugins I tested use the arguments provided, some don't
                    - got amazed couple of times by misleading information provided in a WCX plug-in HELP file, but luckily had OllyDbg at hand :) 
 2006-12-30 v. 1.00 - first version

-- Credits --
perchwasamara for hint on SetProcessDataProc

Feel free to play with the code to modify it up to your needs.
If you happen to use my code, don't forget about creditz :-)

Author: Adam Blaszczyk (c) 2006/2007
WWW:    http://www.kakeeware.com
e-mail: adam[]kakeeware[]com