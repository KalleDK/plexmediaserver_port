# Created by: KalleDK <plexmaintainer@k-moeller.dk>
# $FreeBSD$

PORTNAME=	plexmediaserver
PORTVERSION=	0.9.7.23.0
CATEGORIES=	multimedia
MASTER_SITES=	http://www.plexapp.com/elan/
DISTFILES=	PlexMediaServer-${PORTVERSION}-8e6b2a8.tar.bz2

MAINTAINER=	plexmaintainer@k-moeller.dk
COMMENT=	Plex Media Server

NO_BUILD=	yes
WRKSRC=	${WRKDIR}/PlexMediaServer-${PORTVERSION}-8e6b2a8

USE_RC_SUBR=	plexmediaserver

SUB_FILES=	plexmediaserver
SUB_LIST=	SUPPORT_PATH=${SUPPORT_PATH} DATADIR="${DATADIR}" USERS=${USERS}

USERS=	plex
GROUPS=	plex
SUPPORT_PATH?=	${DATADIR}/plexdata

ONLY_FOR_ARCHS=	amd64

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 900000
	IGNORE= Supplied binaries compiled for FreeBSD 9
.endif

do-install:
	(cd ${WRKSRC} && ${COPYTREE_SHARE} Resources ${DATADIR})
	${INSTALL_PROGRAM} ${WRKSRC}/Plex\ DLNA\ Server ${DATADIR}
	${INSTALL_PROGRAM} ${WRKSRC}/Plex\ Media\ Scanner ${DATADIR}
	${INSTALL_PROGRAM} ${WRKSRC}/Plex\ Media\ Server ${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/start.sh ${DATADIR}
	${INSTALL_LIB} ${WRKSRC}/lib* ${DATADIR}
	${CHMOD} a+x ${DATADIR}/Resources/rsync
	${CHMOD} a+x ${DATADIR}/Resources/Plex\ New\ Transcoder
	${CHMOD} a+x ${DATADIR}/Resources/Plex\ Transcoder
	${CHMOD} a+x ${DATADIR}/Resources/Python/bin/python
	${CHMOD} u+w ${DATADIR}/Resources/com.plexapp.plugins.library.db
	${LN} -s ${DATADIR}/libpython2.7.so.1 ${DATADIR}/libpython2.7.so
	${INSTALL} -d -o ${USERS} -g ${GROUPS} "${SUPPORT_PATH}/Plex Media Server"
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/English.lproj
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/Python/lib/python2.7/test
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/Python/lib/python2.7/lib-tk
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/Python/lib/python2.7/lib-old
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/Python/lib/python2.7/idlelib
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/Python/lib/python2.7/email/test
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/Python/lib/python2.7/distutils
	${INSTALL} -d ${PREFIX}/share/plexmediaserver/Resources/Python/lib/python2.7/bsddb

.include <bsd.port.post.mk>
