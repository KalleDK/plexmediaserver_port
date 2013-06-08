# $FreeBSD$

PORTNAME=	plexmediaserver
PORTVERSION=	0.9.7.23.0
CATEGORIES=	multimedia
MASTER_SITES=	http://www.plexapp.com/elan/
DISTFILES=	PlexMediaServer-${PORTVERSION}-${GH_COMMIT}.tar.bz2
SUPPORT_DIR?=	{PREFIX}/lib

MAINTAINER=	plexmaintainer@k-moeller.dk
COMMENT=	Plex Media Server

GH_COMMIT=	8e6b2a8

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/PlexMediaServer-${PORTVERSION}-${GH_COMMIT}


post-patch:
	${REINPLACE_CMD} -e 's|"SCRIPTPATH"|"${DATADIR}"|' ${WRKSRC}/start.sh
	${REINPLACE_CMD} -e 's|"PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR"|${SUPPORT_DIR}|' ${WRKSRC}/start.sh

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

.include <bsd.port.mk>
