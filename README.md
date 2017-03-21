# sabayon-tools
This is my Portage overlay, it was originally intended for Atom with ebuilds to install Atom from binary packages on Sabayon Linux. It has since been expanded to include extra packages and be intended for Funtoo Linux. To add this overlay run (as root):
```sh
layman -a sabayon-tools
```

I copied the `app-editors/atom-bin` ebuild across from Jorgicio, I felt the need to because its desktop config file has some issues, at least in my eyes. Its desktop config file is named `_usr_bin_atom_%U-atom-bin.desktop` with contents:

```
[Desktop Entry]
Name=atom
Type=Application
Comment=A hackable text editor for the 21st Century. - Binary package
Exec=/usr/bin/atom %U
TryExec=/usr/bin/atom
Icon=atom
Categories=GNOME;GTK;Utility;TextEditor;Development;
GenericName=Text Editor
MimeType=text/plain;
StartupNotify=true
StartupWMClass=atom
```

mine is named `atom.desktop` with contents:

```
[Desktop Entry]
Name=Atom
Comment=The hackable text editor for the 21st Century
Type=Application
Exec=atom %F
GenericName=Text editor
Categories=TextEditor;Development;
Icon=atom
StartupNotify=true
MimeType=application/javascript;application/json;application/x-desktop;application/x-httpd-eruby;application/xhttpd-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/x-ruby;appliction/x-bash;application/x-csh;application/x-sh;application/x-zsh;application/x-shellscript;application/x-sql;aplication/x-tcl;application/xhtml+xml;application/xml;application/xml-dtd;application/xslt+xml;text/coffeescrit;text/css;text/html;text/plain;text/xml;text/xml-dtd;text/x-bash;text/x-c++;text/x-c++hdr;text/x-c++src;text/-c;text/x-chdr;text/x-csh;text/x-csrc;text/x-dsrc;text/x-diff;text/x-go;text/x-java;text/x-java-source;text/x-akefile;text/x-markdown;text/x-objc;text/x-perl;text/x-php;text/x-python;text/x-ruby;text/x-sh;text/x-zsh;textyaml;inode/directory;
```
