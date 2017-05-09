# Sndio GStreamer plugin

The plugin provides an audio sink and source for GStreamer 0.10.  When it
is installed GStreamer prefers it over the OSS or PulseAudio plugins.

This comes directly from OpenBSD's [multimedia/gstreamer-0.10/plugins-good
port][obsdport].

## Installation

### FreeBSD

Use the [FreeBSD port][fbsdport] which will take care of everything,
or install the package:

```
pkg install gstreamer-plugins-sndio
```

[fbsdport]: https://www.freshports.org/audio/gstreamer-plugins-sndio
[obsdport]: http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/multimedia/gstreamer-0.10/plugins-good/
