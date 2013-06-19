Welcome to the release notes for ConvertLIT 1.8.
----------------------------------------------------------------
Summary
A.  Usage changes for DRM5 support
B.  Bug fixes
C.  Small GUI front-end 

A.  Important note:  This release, as did all previous releases, changes how 
DRM5 files are handled. 

To enable ConvertLIT for DRM5, do the following:
    Run "ReaderKeyRecoveryTool.exe" on a machine with an activated copy of
    Microsoft Reader

    It should display the email address for your activation, and create a 
    key file in the ConvertLIT program directory.

    Click "[Get Key]".  

    Wait for Microsoft Reader to load.

    Open a DRM5 ebook in Microsoft Reader.  Microsoft Reader should exit -
    this is intentional. 

    ReaderKeyRecoveryTool should display a "Check Mark" with a long number.

    If you exit Reader without opening a DRM5 book, you'll need to re-run 
    ReaderKeyRecoveryTool.

Once you have the "keys.txt" file, you can run ConvertLit on any machine, 
although there is no support for the emulating the ActiveX control to allow
downloads of encrypted LIT titles.

** Please Note ***  ReaderKeyRecoveryTool is NOT Open Source, nor is it 
"Free" (Libre) software, although it is distributed without cost. It can be 
redistributed only with the ConvertLIT binary package.  There are many reasons 
for this being closed-source, but if you have concerns about this, please 
contact us. 
--------------------------------------------------------------------------
B. This release is intended to correct all known outstanding issues with the
convertlit program:

The primary bugs fixed are: 
        Dictionaries are now properly expanded.
        Completely rewrote space handling, to fix "italics" bugs.
        Changed compression library to a new version to fix rare hangs.  
        Create subdirectories.  (Use "-d" to disable).

Remaining problems:
        If ConvertLit fails during conversion, the temporary files are not
        removed.

        ReaderKeyRecoveryTool "hides" behind MSREADER.EXE  

-----------------------------------------------------------------------------
C. LitConverter GUI Wrapper

I've included the contribution of a 3rd party, with express permission from
the creator, of a small GUI wrapper. While I can provide limitted support,
I'll pass on any bugs to the original author. 

This tool is again, not open source, but redistribution with the ConvertLIT
package is expressly permitted. 

I hope this will address the balance of useability while not drastically
expanding the program's footprint. 

