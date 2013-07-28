# Created by: KalleDK <plexmaintainer@k-moeller.dk>
# $FreeBSD$

PORTNAME=	plexmediaserver
PORTVERSION=	0.9.8.4.116
CATEGORIES=	multimedia
MASTER_SITES=	http://plexrpms.markwalker.dk/FreeBSD-PMS/
DISTFILES=	PlexMediaServer-${PORTVERSION}-0cbd4f7-freebsd-amd64.tar.bz2

MAINTAINER=	plexmaintainer@k-moeller.dk
COMMENT=	Plex Media Server

NO_BUILD=	yes
WRKSRC=	${WRKDIR}/PlexMediaServer-${PORTVERSION}-0cbd4f7

USE_RC_SUBR=	plexmediaserver

SUB_FILES=	plexmediaserver
SUB_LIST=	SUPPORT_PATH=${SUPPORT_PATH} SCRIPT_PATH="${SCRIPT_PATH}" USERS=${USERS} GROUPS=${GROUPS}

USERS=	plex
GROUPS=	plex
SUPPORT_PATH?=	${PREFIX}/plexdata
SCRIPT_PATH?=	${DATADIR}


ONLY_FOR_ARCHS=	amd64

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 900000
	IGNORE= Supplied binaries compiled for FreeBSD 9
.endif

do-install:
	(cd ${WRKSRC} && ${COPYTREE_SHARE} Resources ${SCRIPT_PATH})
	${INSTALL_PROGRAM} ${WRKSRC}/Plex\ DLNA\ Server ${SCRIPT_PATH}
	${INSTALL_PROGRAM} ${WRKSRC}/Plex\ Media\ Scanner ${SCRIPT_PATH}
	${INSTALL_PROGRAM} ${WRKSRC}/Plex\ Media\ Server ${SCRIPT_PATH}
	${INSTALL_SCRIPT} ${WRKSRC}/start.sh ${SCRIPT_PATH}
	${INSTALL_LIB} ${WRKSRC}/lib* ${SCRIPT_PATH}
	# Fix permissions to programs and db
	${CHMOD} a+x ${SCRIPT_PATH}/Resources/rsync
	${CHMOD} a+x ${SCRIPT_PATH}/Resources/Plex\ New\ Transcoder
	${CHMOD} a+x ${SCRIPT_PATH}/Resources/Plex\ Transcoder
	${CHMOD} a+x ${SCRIPT_PATH}/Resources/Python/bin/python
	${CHMOD} u+w ${SCRIPT_PATH}/Resources/com.plexapp.plugins.library.db
	# Python fix
	${LN} -s ${SCRIPT_PATH}/libpython2.7.so.1 ${SCRIPT_PATH}/libpython2.7.so
	# Empty Directories
	${INSTALL} -d ${SCRIPT_PATH}/Resources/English.lproj
	${INSTALL} -d ${SCRIPT_PATH}/Resources/Python/lib/python2.7/test
	${INSTALL} -d ${SCRIPT_PATH}/Resources/Python/lib/python2.7/lib-tk
	${INSTALL} -d ${SCRIPT_PATH}/Resources/Python/lib/python2.7/lib-old
	${INSTALL} -d ${SCRIPT_PATH}/Resources/Python/lib/python2.7/idlelib
	${INSTALL} -d ${SCRIPT_PATH}/Resources/Python/lib/python2.7/email/test
	${INSTALL} -d ${SCRIPT_PATH}/Resources/Python/lib/python2.7/distutils
	${INSTALL} -d ${SCRIPT_PATH}/Resources/Python/lib/python2.7/bsddb
	# Install PID dir (Don't know if needed)
	${INSTALL} -d -o ${USERS} -g ${GROUPS} "/var/run/plex"

.include <bsd.port.post.mk>
