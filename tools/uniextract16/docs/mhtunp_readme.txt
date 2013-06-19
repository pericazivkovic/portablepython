MHT Unpacker plugin for Total Commander
Version 0.1.1
---------------------------------------

What is MHT Unpacker?
----------------------
This is a Total Commander freeware plugin that allows to extract resources stored in Microsoft's MHT files. Once the files are extracted, it automatically update the links to images and CSS files in the main HTML file.

What is MHT?
------------
MHT is a file format that allows to save images and WEB pages in only one file. It is usually saved by Microsoft Internet Explorer. Binary files (images, attachments, etc...) are usually encoded using Base64 standard. WEB pages and CSS files are encoded with Quoted-printable format.

Installation
------------
1. Copy "MHTUnp.wcx" into "Total Commander \ Plugins" directory.
2. Go to Configuration -> Options... -> Packer -> Additional packers -> Configure packer extension WCX's
3. Enter "mht" into the edit box
4. Press "New type", browse for plugin, then press "Open"
5. Press all "OK" buttons
6. Enjoy! ;-)

Note: This plugin is compatible with new TC's automatic installation procedure. Just download the file, and open it in TC. Then, follow the installation instructions.

How to use?
-----------
When your cursor is over one of the MHT files previously saved by Internet Explorer, press "Ctrl + Page Down" to enter file. A list of the available resources is presented and then you can extract them to the folder you want to. This plugin does not allow to delete or pack files from or to a MHT file. It is only intended for extraction. It does not need Internet Explorer to work.

What does the plugin extract?
-----------------------------
. HTM files. WEB page being the main file to extract, since it may link to other resources like images or Cascade Style Sheets. The plugin will automatically update the links to these files.
. Images. Both GIF or JPEG files can be extracted.
. Cascade style sheets. CSS files to define styles for the WEB page.

License Agreement
-----------------
This plugin is free software and provided "as is" without any warranty of merchantability or fitness for a particular purpose. This program can be freely copied/distributed without breaking
distributive package integrity.

In no event shall the author be liable for any consequences arising out of or in connection with the using this software. Nevertheless, the author will try to respond to any report about such consequences.

Author! :-)
-----------
Ariel Perez
e-mail: aprod00@hotmail.com

Changes history
---------------
v. 0.1.1 - 12.01.05
  [-] Fixed: Total Commander freezes when opening blank files 
  [-] Fixed: Total Commander freezes when opening files created with MSWord

v. 0.1 - 10.01.05
  [!] First release