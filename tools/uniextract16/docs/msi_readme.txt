msi plugin v1.2 for Total Commander

installation:

- unzip the msi.wcx to your Total Commander installation directory
- choose the menu configuration - options
- choose the packer tab
- click the configure packer extension dlls button
- type msi as new extension
- click new type, and select msi.wcx
- click ok
- type msp as new extension
- select msi.wcx
- click ok

usage:
the plugin provides basic support for browsing and extracting from
msi (microsoft installer) database files.
note: some msi files don't contain any actual data. they only contain
references to external (mostly) cab files (which in turn are described
in another table of the msi file). those can be viewed with the normal
capability of Total Commander and may be on different volumes, in the
same directory (most likely) or elsewhere. the plugin just displays the
files actually contained within the msi file (as ole data stream). msi 
files which don't contain any actual data are displayed as empty. msi 
files may contain data of any type, but most of the time they just
contain one or more cab files.

update:
version 1.2 now also opens msp files (requested by some users). the same as
to msi files also applies to msp files with the addition, that the ole
streams contained in msp files don't have to be entire files, but can
only be patches. the plugin now displays all data streams contained in
the file (also on user request), whatever good it may do.

note:
if you receive an error message indicating that msi.wcx is not a valid
packer plugin (happens on older systems), then you most likely need 
to install the msi dlls on your system. you can get these free of
charge from microsoft:
http://www.microsoft.com/downloads/release.asp?ReleaseID=32831 (for win9x) and
http://www.microsoft.com/downloads/release.asp?ReleaseID=32832 (for nt and 2k)

written by:
alexander gretha
mailto:developer@chicken.sh
