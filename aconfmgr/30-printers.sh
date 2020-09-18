AddPackage cups
CreateLink /etc/systemd/system/multi-user.target.wants/org.cups.cupsd.path /usr/lib/systemd/system/org.cups.cupsd.path
CreateLink /etc/systemd/system/printer.target.wants/org.cups.cupsd.service /usr/lib/systemd/system/org.cups.cupsd.service
CreateLink /etc/systemd/system/sockets.target.wants/org.cups.cupsd.socket /usr/lib/systemd/system/org.cups.cupsd.socket
AddPackage system-config-printer
IgnorePath '/etc/cups/**/*.O'
IgnorePath '/etc/cups/*.O'
# Not real, reasonable config; churns
IgnorePath '/etc/cups/*.conf'
IgnorePath /etc/cups/ssl
IgnorePath /etc/printcap


# Brother QL-570 label printer
AddPackage --foreign brother-ql570
SetFileProperty /usr/lib/cups/filter/brother_lpdwrapper_ql570 mode 755
AddPackage ghostscript
AddPackage glabels
CopyFile /etc/cups/ppd/QL-570.ppd 640 '' cups
CopyFile /usr/share/cups/model/Brother/brother_ql570_printer_en.ppd
CreateDir /usr/share/ppd/Brother
