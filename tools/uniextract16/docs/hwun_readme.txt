 ------------------------------------------------------
  HWUN v0.50a - Heuristic Wise UNpacker (VirtualPascal)
 ------------------------------------------------------

  HWUN is designed for the purpose of extracting WISE
  setup files, made with WISE Installmaster or other
  compatible applications.

  To get in knowledge of your file being in this
  format there are a few things which tell you that
  those big EXE file installer you've got, really
  is a WISE file.

    1. Splash screen with the text "Initializing
       WISE Installation Wizard"
    2. Splash screen with altered text, but with
       graphics in blue, containing "WISE"
    3. The executable icon showing a desktop PC
       with a blue-lined package on the left
       and a floppy disk on the right with a
       yellow label
    4. The executable icon showing a floppy disk
       with a blue arrow pointing to the red
       led of another device

  But nevermind, even if you are not sure, just
  let HWUN run over your installation exe file.

  For further information about commandline
  options and format please start HWUN without
  any parameter.


  Just some words to the data displayed during
  the whole process:

  Approximated offset stands for the offset
  within the file, of which HWUN thinks that
  at this position the packed data and so the
  single - to be installed - files exist.

  Real archive offset displays the address
  within the file containing the VERIFIED, so
  working packed data.

  Last file start displays the start address
  within the installation exe file for the
  last extracted file. Last file end is the
  same except not the start, but the end
  address is shown.

  Last file CRC32 is a checksum, which can be
  found behind the packed data of each single
  file within the big installation exe.
  It is used to verify the extracted files.

  Files extracted shows the number of files
  which are extracted right now.

  Resolved filenames shows the number of files
  for which a filename has been found.

  Multifiles counts the number of files which
  have the same filename as a file extracted
  before the current one. WISE installations
  sometimes have different files with the same
  name for language or operating system purposes.

  Dialog & bitmap files are files which are
  userdefined (i.e. the person who compiled the
  installation program added these files or
  dialogs himself to the installation system).

  Full job completed just shows the progress.


  Some words to the users of older HWUN versions:

  You'll recognize a speed loss of about 50%-75%
  which is simply caused by my selfmade inflate
  routines. They were needed to avoid those
  access violations / runtime errors caused by
  the 1:1 copied inflate unit.

  But: HWUN is still much faster than E_WISE and
  I can't say about ExWise because I still have
  no WISE executable compatible with that one.

  I think the speed is still okay, so the price
  for more stability.

  And another great thing which comes along:
  Whenever an error occurs, it's my fault,
  not the one of Oliver Fromme or some other
  person. I have written every line myself,
  so I understand the whole program. Now you
  can blame everything on me! ;-))


  J„germeister Markus
