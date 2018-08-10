BSD_INSTALL_LIB?=	install -s -m 444
MKDIR?=	mkdir -p

GST_CFLAGS!=	pkg-config --cflags gstreamer-plugins-base-0.10 gstreamer-audio-0.10
GST_LIBS!=	pkg-config --libs gstreamer-plugins-base-0.10 gstreamer-audio-0.10
GST_PLUGINDIR!=	pkg-config --variable=pluginsdir gstreamer-plugins-base-0.10

CFLAGS+=	-fPIC ${GST_CFLAGS}

# These come from multimedia/gstreamer1-plugins' config.h
# Their values don't matter much but they have to be defined
CFLAGS+=	-DGST_LICENSE='"LGPL"'
CFLAGS+=	-DGST_PACKAGE_NAME='"GStreamer Base Plug-ins source release"'
CFLAGS+=	-DGST_PACKAGE_ORIGIN='"Unknown package origin"'
CFLAGS+=	-DPACKAGE='"gst-plugins-good"' -DVERSION='"0.10"'

LDFLAGS+=	-Wl,--as-needed

OBJS=	gstsndio.o \
	sndiosink.o \
	sndiosrc.o

all: libgstsndio.so

libgstsndio.so: ${OBJS}
	${CC} ${LDFLAGS} -shared -o libgstsndio.so ${OBJS} ${GST_LIBS} -lsndio

clean:
	rm -f libgstsndio.so ${OBJS}

install:
	${MKDIR} ${DESTDIR}${GST_PLUGINDIR}
	${BSD_INSTALL_LIB} libgstsndio.so ${DESTDIR}${GST_PLUGINDIR}
