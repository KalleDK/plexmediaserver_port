--- start.sh.orig	2013-04-16 15:51:41.000000000 +0200
+++ start.sh	2013-06-09 00:59:17.139580510 +0200
@@ -1,11 +1,15 @@
 #!/bin/sh
-#SCRIPTPATH=$(dirname $(python -c 'import sys,os;print os.path.realpath(sys.argv[1])' $0))
-SCRIPT=$(readlink -f $0)
-SCRIPTPATH=`dirname ${SCRIPT}`
+if [ $# -gt 0 ]; then
+	SUPPORT_PATH=$1
+else
+	SUPPORT_PATH=%%SUPPORT_PATH%%
+fi
+SCRIPTPATH=%%SCRIPT_PATH%%
 export LD_LIBRARY_PATH="${SCRIPTPATH}"
 export PLEX_MEDIA_SERVER_HOME="${SCRIPTPATH}"
 export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
-export LC_ALL="en_US.UTF-8"
-export LANG="en_US.UTF-8"
+export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=$SUPPORT_PATH
+export LC_ALL="C"
+export LANG="C"
 ulimit -s 3000
-./Plex\ Media\ Server
+${SCRIPTPATH}/Plex\ Media\ Server
