plexmediaserver_port
====================

##Install

```no-highlight
fetch https://github.com/KalleDK/plexmediaserver_port/raw/master/tarball/plexmediaserver.tar.gz
tar zxvf plexmediaserver.tar.gz
cd plexmediaserver
make WITH_USER install
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
