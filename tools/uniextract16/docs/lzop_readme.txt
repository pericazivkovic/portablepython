NAME
    lzop - compress or expand files

ABSTRACT
    lzop is a file compressor very similar to gzip. lzop favors speed over
    compression ratio.

SYNOPSIS
    lzop [ *command* ] [ *options* ] [ *filename* ... ]

    lzop [-dxlthIVL19] [-qvcfFnNkU] [-o *file*] [-p[*path*]] [-S *suffix*]
    [*filename* ...]

DESCRIPTION
    lzop reduces the size of the named files. Whenever possible, each file
    is compressed into one with the extension .lzo, while keeping the same
    ownership modes, access and modification times. If no files are
    specified, or if a file name is "-", lzop tries to compress the standard
    input to the standard output. lzop will only attempt to compress regular
    files or symbolic links to regular files. In particular, it will ignore
    directories.

    If the compressed file name is too long for its file system, lzop
    truncates it.

    Compressed files can be restored to their original form using lzop -d.
    lzop -d takes a list of files on its command line and decompresses each
    file whose name ends with .lzo and which begins with the correct magic
    number to an uncompressed file without the original extension. lzop -d
    also recognizes the special extension .tzo as shorthand for .tar.lzo.
    When compressing, lzop uses the .tzo extension if necessary instead of
    truncating a file with a .tar extension.

    lzop stores the original file name, mode and time stamp in the
    compressed file. These can be used when decompressing the file with the
    -d option. This is useful when the compressed file name was truncated or
    when the time stamp was not preserved after a file transfer.

    lzop preserves the ownership, mode and time stamp of files when
    compressing. When decompressing lzop restores the mode and time stamp if
    present in the compressed files. See the options -n, -N, --no-mode and
    --no-time for more information.

    lzop always keeps original files unchanged unless you use the option -U.

    lzop uses the *LZO data compression library* for compression services.
    The amount of compression obtained depends on the size of the input and
    the distribution of common substrings. Typically, text such as source
    code or English is compressed into 40-50% of the original size, and
    large files usually compress much better than small ones. Compression
    and decompression speed is generally much faster than that achieved by
    gzip, but compression ratio is worse.

  COMPRESSION LEVELS
    lzop offers the following compression levels of the LZO1X algorithm:

    -3  the default level offers pretty fast compression. -2, -3, -4, -5 and
        -6 are currently all equivalent - this may change in a future
        release.

    -1, --fast
        can be even a little bit faster in some cases - but most times you
        won't notice the difference

    -7, -8, -9, --best
        these compression levels are mainly intended for generating
        pre-compressed data - especially -9 can be somewhat slow

    Decompression is *very* fast for all compression levels, and
    decompression speed is not affected by the compression level.

MAIN COMMAND
    If no other command is given then lzop defaults to compression (using
    compression level -3).

    -#, --fast, --best
        Regulate the speed of compression using the specified digit #, where
        -1 or --fast indicates the fastest compression method (less
        compression) and -9 or --best indicates the slowest compression
        method (best compression). The default compression level is -3.

    -d, --decompress, --uncompress
        Decompress. Each file will be placed into same the directory as the
        compressed file.

    -x, --extract
        Extract compressed files to the current working directory. This is
        the same as `-dNp'.

    -t, --test
        Test. Check the compressed file integrity.

    -l, --list
        For each compressed file, list the following fields:

          method: compression method
          compressed: size of the compressed file
          uncompr.: size of the uncompressed file
          ratio: compression ratio
          uncompressed_name: name of the uncompressed file

        In combination with the --verbose option, the following fields are
        also displayed:

          date & time: time stamp for the uncompressed file

        With --name, the uncompressed name, date and time are those stored
        within the compress file if present.

        With --verbose, the size totals and compression ratio for all files
        is also displayed. With --quiet, the title and totals lines are not
        displayed.

        Note that lzop defines compression ratio as compressed_size /
        uncompressed_size.

    --ls, --ls=*FLAGS*
        List each compressed file in a format similar to ls -ln.

        The following flags are currently honoured: F Append a `*' for
        executable files. G Inhibit display of group information. Q Enclose
        file names in double quotes.

    --info
        For each compressed file, list the internal header fields.

    -I, --sysinfo
        Display information about the system and quit.

    -L, --license
        Display the lzop license and quit.

    -h, -H, --help
        Display a help screen and quit.

    -V  Version. Display the version number and compilation options and
        quit.

    --version
        Version. Display the version number and quit.

    Commands are listed in increasing priority here, i.e. -t has priority
    over -d, -l over -t, and so on.

OPTIONS
    -c, --stdout, --to-stdout
        Write output on standard output. If there are several input files,
        the output consists of a sequence of independently (de)compressed
        members. To obtain better compression, concatenate all input files
        before compressing them.

    -o *FILE*, --output=*FILE*
        Write output to the file *FILE*. If there are several input files,
        the output consists of a sequence of independently (de)compressed
        members.

    -p, -p*DIR*, --path=*DIR*
        Write output files into the directory *DIR* instead of the directory
        determined by the input file. If *DIR* is omitted, then write to the
        current working directory.

    -f, --force
        Force lzop to

         - overwrite existing files
         - (de-)compress from stdin even if it seems a terminal
         - (de-)compress to stdout even if it seems a terminal
         - allow option -c in combination with -U

        Using -f two or more times forces things like

         - compress files that already have a .lzo suffix
         - try to decompress files that do not have a valid suffix
         - try to handle compressed files with unknown header flags

        Use with care.

    -F, --no-checksum
        Do not store or verify a checksum of the uncompressed file when
        compressing or decompressing. This speeds up the operation of lzop a
        little bit (especially when decompressing), but as unnoticed data
        corruption can happen in case of damaged compressed files the usage
        of this option is not generally recommended. Also, a checksum is
        always stored when compressing with one of the slow compression
        levels (-7, -8 or -9), regardless of this option.

    -n, --no-name
        When decompressing, do not restore the original file name if present
        (remove only the lzop suffix from the compressed file name). This
        option is the default under UNIX.

    -N, --name
        When decompressing, restore the original file name if present. This
        option is useful on systems which have a limit on file name length.
        If the original name saved in the compressed file is not suitable
        for its file system, a new name is constructed from the original one
        to make it legal. This option is the default under DOS, Windows and
        OS/2.

    -P  When decompressing, restore the original path and file name if
        present. When compressing, store the relative (and cleaned) path
        name. This option is mainly useful when using archive mode - see
        usage examples below.

    --no-mode
        When decompressing, do not restore the original mode (permissions)
        saved in the compressed file.

    --no-time
        When decompressing, do not restore the original time stamp saved in
        the compressed file.

    -S *.suf*, --suffix=*.suf*
        Use suffix *.suf* instead of *.lzo*. The suffix must not contain
        multiple dots and special characters like '+' or '*', and suffixes
        other than *.lzo* should be avoided to avoid confusion when files
        are transferred to other systems.

    -k, --keep
        Do not delete input files. This is the default.

    -U, --unlink, --delete
        Delete input files after succesfull compression or decompression.
        Use this option to make lzop behave like gzip and bzip2. Note that
        explicitly giving -k overrides -U.

    --crc32
        Use a crc32 checksum instead of a adler32 checksum.

    --no-warn
        Suppress all warnings.

    --ignore-warn
        Suppress all warnings, and never exit with exit status 2.

    -q, --quiet, --silent
        Suppress all warnings and decrease the verbosity of some commands
        like --list or --test.

    -v, --verbose
        Verbose. Display the name for each file compressed or decompressed.
        Multiple -v can be used to increase the verbosity of some commands
        like --list or --test.

    --  Specifies that this is the end of the options. Any file name after
        -- will not be interpreted as an option even if it starts with a
        hyphen.

OTHER OPTIONS
    --no-stdin
        Do not try to read standard input (but a file name "-" will still
        override this option). In old versions of lzop, this option was
        necessary when used in cron jobs (which do not have a controlling
        terminal).

    --filter=*NUMBER*
        Rarely useful. Preprocess data with a special "multimedia" filter
        before compressing in order to improve compression ratio. *NUMBER*
        must be a decimal number from 1 to 16, inclusive. Using a filter
        slows down both compression and decompression quite a bit, and the
        compression ratio usually doesn't improve much either... More
        effective filters may be added in the future, though.

        You can try --filter=1 with data like 8-bit sound samples,
        --filter=2 with 16-bit samples or depth-16 images, etc.

        Un-filtering during decompression is handled automatically.

    -C, --checksum
        Deprecated. Only for compatibility with very old versions as lzop
        now uses a checksum by default. This option will get removed in a
        future release.

    --no-color
        Do not use any color escape sequences.

    --mono
        Assume a mono ANSI terminal. This is the default under UNIX (if
        console support is compiled in).

    --color
        Assume a color ANSI terminal or try full-screen access. This is the
        default under DOS and in a Linux virtual console (if console support
        is compiled in).

ADVANCED USAGE
    lzop allows you to deal with your files in many flexible ways. Here are
    some usage examples:

    backup mode
       tar --use-compress-program=lzop -cf archive.tar.lzo files..

       This is the recommended mode for creating (possibly huge) backups.
       Requires GNU tar or a compatible version which accpets the
       `--use-compress-program=XXX' option.

    single file mode: individually (de)compress each file
      create
        lzop a.c             -> create a.c.lzo
        lzop a.c b.c         -> create a.c.lzo & b.c.lzo
        lzop -U a.c b.c      -> create a.c.lzo & b.c.lzo and delete a.c & b.c
        lzop *.c

      extract
        lzop -d a.c.lzo      -> restore a.c
        lzop -df a.c.lzo     -> restore a.c, overwrite if already exists
        lzop -d *.lzo

      list
        lzop -l a.c.lzo
        lzop -l *.lzo
        lzop -lv *.lzo       -> be verbose

      test
        lzop -t a.c.lzo
        lzop -tq *.lzo       -> be quiet

    pipe mode: (de)compress from stdin to stdout
      create
        lzop < a.c > y.lzo
        cat a.c | lzop > y.lzo
        tar -cf - *.c | lzop > y.tar.lzo     -> create a compressed tar file

      extract
        lzop -d < y.lzo > a.c
        lzop -d < y.tar.lzo | tar -xvf -     -> extract a tar file
        lzop -d < y.tar.lzo | tar -tvf -     -> list a tar file

      list
        lzop -l < y.lzo
        cat y.lzo | lzop -l

      test
        lzop -t < y.lzo
        cat y.lzo | lzop -t

    stdout mode: (de)compress to stdout
      create
        lzop -c a.c > y.lzo

      extract
        lzop -dc y.lzo > a.c
        lzop -dc y.tar.lzo | tar -tvf -      -> list a tar file

    archive mode: compress/extract multiple files into a single archive file
      create
        lzop a.c b.c -o sources.lzo          -> create an archive
        lzop -P src/*.c -o sources.lzo       -> create an archive, store path name
        lzop -c *.c > sources.lzo            -> another way to create an archive
        lzop -c *.h >> sources.lzo           -> add files to archive

      extract
        lzop -dN sources.lzo
        lzop -x ../src/sources.lzo           -> extract to current directory
        lzop -x -p/tmp < ../src/sources.lzo  -> extract to /tmp directory

      list
        lzop -lNv sources.lzo

      test
        lzop -t sources.lzo
        lzop -tvv sources.lzo                -> be very verbose

    If you wish to create a single archive file with multiple members so
    that members can later be extracted independently, you should prefer a
    full-featured archiver such as tar. The latest version of GNU tar
    supports the --use-compress-program=lzop option to invoke lzop
    transparently. lzop is designed as a complement to tar, not as a
    replacement.

ENVIRONMENT
    The environment variable LZOP can hold a set of default options for
    lzop. These options are interpreted first and can be overwritten by
    explicit command line parameters. For example:

        for sh/ksh/zsh:    LZOP="-1v --name"; export LZOP
        for csh/tcsh:      setenv LZOP "-1v --name"
        for DOS:           set LZOP=-1v --name

    On Vax/VMS, the name of the environment variable is LZOP_OPT, to avoid a
    conflict with the symbol set for invocation of the program.

    Not all of the options are valid in the environment variable - lzop will
    tell you.

SEE ALSO
    bzip2(1), gzip(1), tar(1)

    Precompiled binaries for some platforms are available from the lzop home
    page.

        see http://www.oberhumer.com/opensource/lzop/

    lzop uses the LZO data compression library for compression services.

        see http://www.oberhumer.com/opensource/lzo/

DIAGNOSTICS
    Exit status is normally 0; if an error occurs, exit status is 1. If a
    warning occurs, exit status is 2 (unless option --ignore-warn is
    effect).

    lzop's diagnostics are intended to be self-explanatory.

BUGS
    Please report all problems immediately to the author.

AUTHOR
    Markus Franz Xaver Johannes Oberhumer <markus@oberhumer.com>
    http://www.oberhumer.com/opensource/lzop/

COPYRIGHT
    lzop and the LZO library are Copyright (C) 1996, 1997, 1998, 1999, 2000,
    2001, 2002, 2003 by Markus Franz Xaver Johannes Oberhumer.

    lzop and the LZO library are distributed under the terms of the GNU
    General Public License (GPL).

    Legal info: If want to integrate lzop into your commercial
    (backup-)system please check the GNU GPL FAQ at
    http://www.gnu.org/licenses/gpl-faq.html about possible implications.

