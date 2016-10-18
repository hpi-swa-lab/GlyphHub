PLUGIN_NAME=HbFtPlugin
SOURCES=Fonts.c HbFtPlugin.c
PATH_TO_SQUEAK=../../../Squeak5.1-16548-32bit-201608171728-Linux
BASE=../../../opensmalltalk-vm
PKGLIBS=freetype2 harfbuzz

CFLAGS=-m32 \
	   -Wall \
	   -I$(BASE)/platforms/Cross/vm \
	   -I$(BASE)/platforms/Cross/plugins/$(PLUGIN_NAME) \
	   -I../Cross \
	   -I$(BASE)/platforms/unix/vm \
	   -I$(BASE)/src/vm \
	   -I$(BASE)/build.linux64x64/squeak.cog.spur/build \
	   -DLSB_FIRST=1 \
		$(shell env PKG_CONFIG_PATH=/usr/lib/i386-linux-gnu/pkgconfig pkg-config --cflags $(PKGLIBS))
LDFLAGS=-m32 \
	   -shared \
	   -fPIC
LDLIBS=$(shell env PKG_CONFIG_PATH=/usr/lib/i386-linux-gnu/pkgconfig pkg-config --libs $(PKGLIBS))
SOURCES += $(BASE)/src/plugins/$(PLUGIN_NAME)/$(PLUGIN_NAME).c
OBJECTS = $(SOURCES:.c=.o)

EXECUTABLE=$(PATH_TO_SQUEAK)/bin/$(PLUGIN_NAME)

install: $(EXECUTABLE)

$(EXECUTABLE): $(PLUGIN_NAME)
	cp $(PLUGIN_NAME) $(EXECUTABLE)

$(PLUGIN_NAME): $(OBJECTS)

clean:
	rm -f $(EXECUTABLE) $(PLUGIN_NAME) $(OBJECTS)

.PHONY: clean install

