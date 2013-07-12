plexmediaserver_port
====================

##Install

```no-highlight
fetch -o plexmediaserver_port-1.4.tar.gz https://github.com/KalleDK/plexmediaserver_port/archive/v1.4.tar.gz
tar zxvf plexmediaserver_port-1.4.tar.gz
cd plexmediaserver_port-1.4
make WITH_USER=YES install
```

###Make options
######(Shown here with default paths)

```no-highlight
SUPPORT_PATH=/usr/local/lib/plexdata
WITH_USER=NO
```

###RC_VAR
######(Shown here with default paths)

```no-highlight
plexmediaserver_enable="YES"
plexmediaserver_support_path="/usr/local/lib/plexdata"  (optional)
plexmediaserver_script_path="/usr/local/share/plexmediaserver" (optional)
```

###Package install

```no-highlight
pkg_add plexmediaserver-0.9.7.23.0.tbz
```

### Special Thanks
```no-highlight
Elan (Plex Sheriff)
Felderado (Plex FreeBSD)
```
