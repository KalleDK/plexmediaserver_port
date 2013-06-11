# $FreeBSD$

PORTNAME=	plexmediaserver
PORTVERSION=	0.9.7.23.0
CATEGORIES=	multimedia
MASTER_SITES=	http://www.plexapp.com/elan/
DISTFILES=	PlexMediaServer-${PORTVERSION}-${GH_COMMIT}.tar.bz2
SUPPORT_PATH?=	${PREFIX}/lib/plexdata

MAINTAINER=	plexmaintainer@k-moeller.dk
COMMENT=	Plex Media Server

GH_COMMIT=	8e6b2a8

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/PlexMediaServer-${PORTVERSION}-${GH_COMMIT}

USE_RC_SUBR=	plexmediaserver

SUB_FILES=	plexmediaserver
SUB_LIST=	SUPPORT_PATH=${SUPPORT_PATH} SCRIPT_PATH="${DATADIR}" START_CMD="${START_CMD}"

PW=		/usr/sbin/pw
PLEXUSER=	plex
PLEXGROUP=	plex

.if defined(WITH_USER)
START_CMD=	"su\ -l\ plex\ "
.else
START_CMD=	""
.endif

post-patch:
	${REINPLACE_CMD} -e 's|%%SCRIPT_PATH%%|"${DATADIR}"|' ${PATCH_WRKSRC}/start.sh
	${REINPLACE_CMD} -e 's|%%SUPPORT_PATH%%|"${SUPPORT_PATH}"|' ${PATCH_WRKSRC}/start.sh

pre-install:
.if defined(WITH_USER)
	@if ${PW} groupshow "${PLEXGROUP}" >/dev/null 2>&1; then \
		${ECHO_MSG} "You already have a group \"${PLEXGROUP}\", so I will use it."; \
	else \
		if ${PW} groupadd ${PLEXGROUP} -h -; then \
			${ECHO_MSG} "Added group \"${PLEXGROUP}\"."; \
		else \
			${ECHO_MSG} "Adding group \"${PLEXGROUP}\" failed..."; \
			${ECHO_MSG} "Please create it, and try again."; \
			${FALSE}; \
		fi; \
	fi

	@if ${PW} usershow "${PLEXUSER}" >/dev/null 2>&1; then \
		${ECHO_MSG} "You already have a user \"${PLEXUSER}\", so I will use it."; \
	else \
		if ${PW} useradd ${PLEXUSER} -d ${SUPPORT_PATH} -s /bin/sh -c "Plex Daemon" -h -; then \
			${ECHO_MSG} "Added user \"${PLEXUSER}\"."; \
		else \
			${ECHO_MSG} "Adding user \"${PLEXUSER}\" failed..."; \
			${ECHO_MSG} "Please create it, and try again."; \
			${FALSE}; \
		fi; \
	fi
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
	${MKDIR} ${SUPPORT_PATH}
	
	
post-install:
.if defined(WITH_USER)
	${CHOWN} -R ${PLEXUSER}:${PLEXGROUP} ${SUPPORT_PATH}
.endif

.include <bsd.port.mk>
