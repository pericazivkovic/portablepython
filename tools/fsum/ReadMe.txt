                          fsum Version 2.52 ReadMe File

                    (C) Copyright 1999-2007 SlavaSoft Inc.

    Contents

    1. Warranty Disclaimer
    2. Introduction
    3. Major features
    4. What's new in this version
    5. md5sum compatibility
    6. FileList	
    7. Installing and Uninstalling   
    8. Usage


    1. Warranty Disclaimer
    ----------------------
    THE SOFTWARE IS PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, SLAVASOFT INC. FURTHER DISCLAIMS ALL WARRANTIES, INCLUDING WITHOUT LIMITATION ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. THE ENTIRE RISK ARISING OUT OF THE USE OR PERFORMANCE OF THE PRODUCT AND DOCUMENTATION REMAINS WITH RECIPIENT. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL SLAVASOFT INC. BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, DIRECT, INDIRECT, SPECIAL, PUNITIVE, OR OTHER DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, LOSS OF BUSINESS INFORMATION, OR OTHER PECUNIARY LOSS) ARISING OUT OF THE LICENSE AGREEMENT OR THE USE OF OR INABILITY TO USE THE PRODUCT, EVEN IF SLAVASOFT INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

    2. Introduction
    ---------------
    A handy command line utility for file checksum generation and verification. It offers a choice of 11 most popular hash and checksum algorithms for file checksum calculation.

    3. Major features
    -----------------
         1. Possibility to calculate file checksum using any of the 12 well-known and documented hash and checksum algorithms: MD2, MD4, MD5, SHA-1, SHA-2(256, 384, 512), RIPEMD-160, PANAMA, TIGER, ADLER32, CRC32;
	 2. Possibility to calculate file checksum using a custom hash algorithm (MD4-based) used in eDonkey and eMule applications; 
         3. Possibility to act recursively;
         4. Work with large size files. (Tested on files with size up to 5 GB.);
         5. Full compatibility with md5sum utility;
         6. Support of .MD5 and .SFV file formats.
         
    4. What's new in this version
    -----------------------------
         1. Added support for MD4 hash algorithm.
         2. Added support for a custom hash algorithm (MD4-based) used in eDonkey and eMule applications.
	 3. Minor bug fixes

    5. md5sum compatibility
    ----------------------
 
    fsum without options, or with -c, -w, -s options, works exactly as md5sum. If you use -r option to generate file checksums, md5sum with -c option will verify checksums correctly. These features make fsum a powerful replacement for md5sum. 

    6. File List
    ------------
    fsum.exe    - program file
    ReadMe.txt  - this file
    
    7. Installing and Uninstalling
    ------------------------------
    To install fsum, extract fsum.exe in any directory included in execution path on your harddrive and run fsum.exe. Recomended directory is C:\Windows or C:\WinNT.
    To uninstall fsum, just remove the extracted files from your harddrive.

    8. Usage
    --------
    General form:

    fsum.exe [<OPTIONS>] [<FILES>]

    The usage is flexible. You can use 0 options or many options. The options may be placed in any order.
    If the command contains neither [<OPTIONS>], nor [<FILES>], a simple usage screen is displayed.
    
    The command for file checksums generation MUST NOT include -c option.
    The command for file checksums verification MUST include -c option.

    The command for file checksums generation that works with output or CHECKSUMFILE in .SFV file format MUST include -js option.
    The command for file checksums generation that doesn't work with output or CHECKSUMFILE in .SFV file format MUST NOT include -js option.


    OPTIONS:

    -md2            - Include MD2 algorithm
    -md4	    - Include MD4 algorithm
    -md5            - Include MD5 algorithm
    -sha1           - Include SHA-1 algorithm
    -sha256         - Include SHA-2(256) algorithm
    -sha384         - Include SHA-2(384) algorithm
    -sha512         - Include SHA-2(512) algorithm
    -rmd            - Include RIPEMD-160 algorithm
    -tiger          - Include TIGER algorithm
    -panama         - Include PANAMA algorithm
    -adler          - Include ADLER32 algorithm
    -crc32          - Include CRC32 algorithm
    -edonkey	    - Include MD4-based algorithm used in eDonkey and eMule applications

     These options specify the algorithm(s) chosen for file checksum calculations. 
     If none of these options is selected, and fsum is used for file checksums generation (doesn't include -c option), then
     	1. if -js option is used, the default CRC32 algorithm is chosen and the output is produced in .SFV file format;
     	2. if -js option is not used, the default MD5 algorithm is chosen and the output is produced in .MD5 file format.
     	3. if -jm option is used, the default MD5 algorithm is chosen and the output is produced in .MD5 file format.
     If none of these options are selected, and fsum is used for file checksums verification (includes -c option), then fsum will check all checksums present in CHECKSUMFILE (see -c option for details).

     Note. You can indicate several algorithms in one command. In this case it is used an extended .MD5 or .SFV file format.

     Examples: 

     fsum.exe *.mp3 
     Calculate MD5 checksums for all .mp3 files from the current directory and show them on the screen. The output is in the .MD5 file format.

     fsum.exe -jm *.mp3 
     Calculate MD5 checksums for all .mp3 files from the current directory and show them on the screen. The output is in the .MD5 file format.

     fsum.exe -js *.mp3 
     Calculate CRC32 checksums for all .mp3 files from the current directory and show them on the screen. The output is in the .SFV file format.

     fsum.exe *.wav >digests.md5
     Calculate MD5 checksums for all .wav files from the current directory and save them in the digests.md5 file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .MD5 file format.

     fsum.exe -jm *.wav >digests.md5
     Calculate MD5 checksums for all .wav files from the current directory and save them in the digests.md5 file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .MD5 file format.

     fsum.exe -js *.wav >checksums.sfv
     Calculate CRC32 checksums for all .wav files from the current directory and save them in the checksums.sfv file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .SFV file format.

     fsum.exe -crc32 -md5 *.mp3
     Calculate CRC32 and MD5 checksums for all .mp3 files from the current directory and show them on the screen. The output is in .MD5 file format.

     fsum.exe -crc32 -md5 -jm *.mp3
     Calculate CRC32 and MD5 checksums for all .mp3 files from the current directory and show them on the screen. The output is in .MD5 file format.

     fsum.exe -crc32 -md5 -js *.mp3
     Calculate CRC32 and MD5 checksums for all .mp3 files from the current directory and show them on the screen. The output is in .SFV format.

     fsum.exe -crc32 -md5 -sha1 -tiger *.* >sum.txt
     Calculate CRC32, MD5, SHA1 and TIGER checksums for all files from the current directory and save them in the sum.txt file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in .MD5 file format.

     fsum.exe -crc32 -md5 -sha1 -tiger -jm *.* >sum.txt
     Calculate CRC32, MD5, SHA1 and TIGER checksums for all files from the current directory and save them in the sum.txt file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in .MD5 file format.

     fsum.exe -crc32 -md5 -sha1 -tiger -js *.* >sum.txt
     Calculate CRC32, MD5, SHA1 and TIGER checksums for all files from the current directory and save them in the sum.txt file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .SFV file format.

     fsum.exe -md5 -js *.* >sum.txt
     Calculate MD5 checksums for all files from the current directory and save them in the sum.txt file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .SFV file format.


    -c or --check   - Check sums against given list

     This option is used for file checksums verification. With this option you have to specify the file (CHECKSUMFILE) that contains previously generated checksums for files that need to be verified. fsum will calculate and compare checksums for all those files. If the calculated checksum for a file matches the provided one, then this file is marked with the word "OK", otherwise the file is marked with the word "FAILED".

     Examples: 

     fsum.exe -c sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.txt) of corressponding files from the current directory. When verifying the CHECKSUMFILE, the automatic recognition of its file format is performed. This means that sum.txt can be in .MD5 or in .SFV format.

     fsum.exe -c sum.md5
     Verify checksums for files specified in sum.md5 (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.md5) of corressponding files from the current directory.

     fsum.exe -c sum.sfv
     Verify checksums for files specified in sum.sfv (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.sfv) of corressponding files from the current directory.

     fsum.exe -c -jm sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.txt) of corressponding files from the current directory. If sum.txt is not in .MD5 format no checking is performed. (Don't use -jm option when checking a CHECKSUMFILE that is not in the .MD5 file format.)

     fsum.exe -c -jm sum.md5
     Verify checksums for files specified in sum.md5 (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.md5) of corressponding files from the current directory. If sum.md5 is not in .MD5 format no checking is performed. (Don't use -jm option when checking a CHECKSUMFILE that is not in the .MD5 file format.)

     fsum.exe -c -js sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.txt) of corressponding files from the current directory. If sum.txt is not in .SFV format no checking is performed. (Don't use -js option when checking a CHECKSUMFILE that is not in the .SFV file format.)

     fsum.exe -c -js sum.sfv
     Verify checksums for files specified in sum.sfv (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.sfv) of corressponding files from the current directory. If sum.sfv is not in .SFV format no checking is performed. (Don't use -js option when checking a CHECKSUMFILE that is not in the .SFV file format.)

     fsum.exe -c -crc32 sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. When verifying the CHECKSUMFILE, the automatic recognition of its file format is performed. This means that sum.txt can be in .MD5 or in .SFV format.

     fsum.exe -c -crc32 sum.md5
     Verify checksums for files specified in sum.md5 (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. 

     fsum.exe -c -crc32 sum.sfv
     Verify checksums for files specified in sum.sfv (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. 

     fsum.exe -c -crc32 -jm sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. If sum.txt is not in .MD5 format no checking is performed. (Don't use -jm option when checking a CHECKSUMFILE that is not in the .MD5 file format.)

     fsum.exe -c -crc32 -jm sum.md5
     Verify checksums for files specified in sum.md5 (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. If sum.md5 is not in .MD5 format no checking is performed. (Don't use -jm option when checking a CHECKSUMFILE that is not in the .MD5 file format.)

     fsum.exe -c -crc32 -js sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. If sum.txt is not in .SFV format no checking is performed. (Don't use -js option when checking a CHECKSUMFILE that is not in the .SFV file format.)

     fsum.exe -c -crc32 -js sum.sfv
     Verify checksums for files specified in sum.sfv (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. If sum.sfv is not in .SFV format no checking is performed. (Don't use -js option when checking a CHECKSUMFILE that is not in the .SFV file format.)

     fsum.exe -c -md5 sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using MD5 algorithm) of corressponding files from the current directory. When verifying the CHECKSUMFILE, the automatic recognition of its file format is performed. This means that sum.txt can be in .MD5 or in .SFV format.

     fsum.exe -c -md5 sum.md5
     Verify checksums for files specified in sum.md5 (CHECKSUMFILE) against checksums (computed using MD5 algorithm) of corressponding files from the current directory.

     fsum.exe -c -md5 sum.sfv
     Verify checksums for files specified in sum.sfv (CHECKSUMFILE) against checksums (computed using MD5 algorithm) of corressponding files from the current directory.

     fsum.exe -c -md5 -jm sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using MD5 algorithm) of corressponding files from the current directory. If sum.txt is not in .MD5 format no checking is performed. (Don't use -jm option when checking a CHECKSUMFILE that is not in the .MD5 file format.)

     fsum.exe -c -md5 -js sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using MD5 algorithm) of corressponding files from the current directory. If sum.txt is not in .SFV format no checking is performed. (Don't use -js option when checking a CHECKSUMFILE that is not in the .SFV file format.)

     fsum.exe -c -panama -sha1 sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using PANAMA and SHA1 algorithms) of corressponding files from the current directory. When verifying the CHECKSUMFILE, the automatic recognition of its file format is performed. This means that sum.txt can be in .MD5 or in .SFV format.


    -jm             - Use MD5 format

     This option is used to indicate that the output or CHECKSUMFILE is in .MD5 file format. .MD5 file format is a common format for files used to store file checksums that are calculated based on MD5 hash algorithm. That's why it is reasonable to use this option when there is need to work with MD5 file checksums.
     If -jm IS USED when performing file checksums verification (fsum with -c option) and the CHECKSUMFILE is not in .MD5 file format, no checking is performed.

     Examples: 

     fsum.exe -jm *.* >sums.md5
     Calculate MD5 checksums for all files from the current directory and save them in the sums.md5 file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .MD5 file format.

     fsum.exe -jm *.* >sums.txt
     Calculate MD5 checksums for all files from the current directory and save them in the sums.txt file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .MD5 file format.

     fsum.exe -md5 -jm *.* >sums.md5
     Calculate MD5 checksums for all files from the current directory and save them in the sums.md5 file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .MD5 file format.

     fsum.exe -c -jm sum.md5
     Verify checksums for files specified in sum.md5 (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.md5) of corressponding files from the current directory. If sum.md5 is not in .MD5 format no checking is performed. (Don't use -jm option when checking a CHECKSUMFILE that is not in the .MD5 file format.)

     fsum.exe -c -md5 -jm sum.md5
     Verify checksums for files specified in sum.md5 (CHECKSUMFILE) against checksums (computed using MD5 algorithm) of corressponding files from the current directory. If sum.md5 is not in .MD5 format no checking is performed. (Don't use -jm option when checking a CHECKSUMFILE that is not in the .MD5 file format.)


    -js             - Use SFV format

     This option is used to indicate that the output or CHECKSUMFILE is in .SFV file format. .SFV file format is a common format for files used to store file checksums that are calculated based on CRC32 checksum algorithm. That's why it is reasonable to use this option when there is need to work with CRC32 file checksums.
     If -js IS USED when performing file checksums verification (fsum with -c option) and the CHECKSUMFILE is not in .SFV file format, no checking is performed.

     Examples: 

     fsum.exe -js *.* >sums.sfv
     Calculate CRC32 checksums for all files from the current directory and save them in the sums.sfv file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .SFV file format.

     fsum.exe -js *.* >sums.txt
     Calculate CRC32 checksums for all files from the current directory and save them in the sums.txt file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .SFV file format.

     fsum.exe -crc32 -js *.* >sums.sfv
     Calculate CRC32 checksums for all files from the current directory and save them in the sums.sfv file (CHECKSUMFILE) in the current directory. CHECKSUMFILE is in the .SFV file format.

     fsum.exe -c -js sum.sfv
     Verify checksums for files specified in sum.sfv (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.sfv) of corressponding files from the current directory. If sum.sfv is not in .SFV format no checking is performed. (Don't use -js option when checking a CHECKSUMFILE that is not in the .SFV file format.)

     fsum.exe -c -crc32 -js sum.sfv
     Verify checksums for files specified in sum.sfv (CHECKSUMFILE) against checksums (computed using CRC32 algorithm) of corressponding files from the current directory. If sum.sfv is not in .SFV format no checking is performed. (Don't use -js option when checking a CHECKSUMFILE that is not in the .SFV file format.)


    -jf             - Print only failed lines while checking

     This option is used with the -c option. Use it if you want to see only the files that "FAILED" while performing the file checksums verification.

     Example: 

     fsum.exe -md5 -c -jf digests.md5
     Verify checksums for files specified in digests.md5 against checksums (computed using MD5 algorithm) of corressponding files from the current directory. While checking, output information only about failed files.


    -w or --warn    - Warn about improperly formatted checksum lines

     This option is used with the -c option. Use it if you want to see improperly formatted lines in CHECKSUMFILE.

     Example: 

     fsum.exe -c -w sum.txt
     Verify checksums for files specified in sum.txt (CHECKSUMFILE) against checksums (computed using the same algorithm(s) as those used to generate file checksums in sum.txt) of corressponding files from the current directory. Warn if sum.txt has improperly formatted lines.


    -jnc            - Supress comments

     This option is used without the -c option. Use it if you want to supress the comments in the output or CHECKSUMFILE.

     Example: 

     fsum.exe -jnc *.mp3
     Calculate MD5 checksums for all .mp3 files from the current directory and show them on the screen. The output is in the .MD5 file format. The comments are supressed.


    -d<directory>   - Set working directory

     This option is used to change the working directory.

     Examples: 

     fsum.exe -dC:\Music *.mp3
     Calculate MD5 checksums for all .mp3 files from the "C:\Music" directory and show them on the screen.

     fsum.exe -crc32 -dC:\Music *.mp3 >Checksums.txt
     Calculate CRC32 checksums for all .mp3 files from the "C:\Music" directory and save them in the Checksums.txt file in the current directory.

     fsum.exe -crc32 -dC:\Music *.mp3 >C:\Test\Checksums.txt
     Calculate CRC32 checksums for all .mp3 files from the "C:\Music" directory and save them in the Checksums.txt file in "C:\Test" directory.


    -r              - Recurse through subdirectories

     This option causes fsum to look for files in all included subdirectories as well as in the current directory.
	
     Examples: 

     fsum.exe -r *.*
     Calculate MD5 checksums for all files from the current directory and from all included subdirectories, and show them on the screen.

     fsum.exe -r -dC:\Music *.mp3
     Calculate MD5 checksums for all .mp3 files from the "C:\Music" directory and from all included subdirectories, and show them on the screen.


    -s or --status  - Don't output anything, status code shows success

     This option is usually used in batch files.
