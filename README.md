plexmediaserver_port
====================

##Install from package

```no-highlight
fetch http://plexrpms.markwalker.dk/FreeBSD-PMS/plexmediaserver-0.9.8.4.125.tbz
pkg_add plexmediaserver-0.9.8.4.125.tbz
```

###Make options
######(Shown here with default paths)

```no-highlight
SUPPORT_PATH=/usr/local/plexdata
```

###RC_VAR
######(Shown here with default paths)

```no-highlight
plexmediaserver_enable="YES"
plexmediaserver_support_path="/usr/local/plexdata"  (optional)
plexmediaserver_tmp="/tmp" (optional)
```

### Special Thanks
```no-highlight
Elan (Plex Sheriff)
Feld (Plex FreeBSD)
ZiGGiMoN (Plex Ninja)
KalleDK (original port author)
```
