AddPackage cups
CreateLink /etc/systemd/system/multi-user.target.wants/org.cups.cupsd.path /usr/lib/systemd/system/org.cups.cupsd.path
CreateLink /etc/systemd/system/printer.target.wants/org.cups.cupsd.service /usr/lib/systemd/system/org.cups.cupsd.service
CreateLink /etc/systemd/system/sockets.target.wants/org.cups.cupsd.socket /usr/lib/systemd/system/org.cups.cupsd.socket
AddPackage system-config-printer
IgnorePath '/etc/cups/**/*.O'
IgnorePath '/etc/cups/*.O'
IgnorePath /etc/cups/ssl

SetFileProperty /etc/cups/classes.conf mode 600
CopyFile /etc/cups/printers.conf 600
CopyFile /etc/cups/subscriptions.conf 640
CopyFile /etc/printcap


# Brother QL-570 label printer
AddPackage ghostscript
AddPackage glabels
CopyFile /etc/cups/ppd/QL-570.ppd 640 '' cups
# download & rpmextract https://support.brother.com/g/b/downloadend.aspx?c=gb&lang=en&prod=lpql570euk&os=131&dlid=dlfp002175_000&flang=178&type3=591
CopyFile /opt/brother/PTouch/ql570/cupswrapper/brcupsconfpt1 755 ojf ojf
CopyFile /opt/brother/PTouch/ql570/cupswrapper/cupswrapperql570pt1 755 ojf ojf
CopyFile /opt/brother/PTouch/ql570/inf/ImagingArea '' ojf ojf
CopyFile /opt/brother/PTouch/ql570/inf/brPrintListpt1 '' ojf ojf
CopyFile /opt/brother/PTouch/ql570/inf/brql570func '' ojf ojf
CopyFile /opt/brother/PTouch/ql570/inf/brql570init '' ojf ojf
CopyFile /opt/brother/PTouch/ql570/inf/brql570rc '' ojf ojf
CopyFile /opt/brother/PTouch/ql570/inf/paperinfql570pt1 '' ojf ojf
CopyFile /opt/brother/PTouch/ql570/inf/setupPrintcappt1 755 ojf ojf
CopyFile /opt/brother/PTouch/ql570/lpd/brpapertoolcups 755 ojf ojf
CopyFile /opt/brother/PTouch/ql570/lpd/filterql570 755 ojf ojf
CopyFile /opt/brother/PTouch/ql570/lpd/psconvertpt1 755 ojf ojf
CopyFile /opt/brother/PTouch/ql570/lpd/rastertobrpt1 755 ojf ojf
SetFileProperty /opt/brother/PTouch/ql570/cupswrapper group ojf
SetFileProperty /opt/brother/PTouch/ql570/cupswrapper owner ojf
SetFileProperty /opt/brother/PTouch/ql570/inf group ojf
SetFileProperty /opt/brother/PTouch/ql570/inf owner ojf
SetFileProperty /opt/brother/PTouch/ql570/lpd group ojf
SetFileProperty /opt/brother/PTouch/ql570/lpd owner ojf
SetFileProperty /opt/brother/PTouch/ql570 group ojf
SetFileProperty /opt/brother/PTouch/ql570 owner ojf
SetFileProperty /opt/brother/PTouch group ojf
SetFileProperty /opt/brother/PTouch owner ojf
SetFileProperty /opt/brother group ojf
SetFileProperty /opt/brother owner ojf
# download & rpmextract https://support.brother.com/g/b/downloadend.aspx?c=gb&lang=en&prod=lpql570euk&os=131&dlid=dlfp002173_000&flang=178&type3=589
CopyFile /usr/bin/brpapertoollpr_ql570 755 ojf ojf
CopyFile /usr/bin/brprintconfpt1_ql570 755 ojf ojf
CopyFile /usr/bin/brps2ps_ql570 755 ojf ojf
CopyFile /usr/lib/cups/filter/brother_lpdwrapper_ql570 755
CopyFile /usr/share/cups/model/Brother/brother_ql570_printer_en.ppd
CreateDir /usr/share/ppd/Brother
