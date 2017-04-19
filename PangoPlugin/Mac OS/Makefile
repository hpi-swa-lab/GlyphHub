PLUGIN_NAME=PangoPlugin
SOURCES=PangoPlugin.c
PATH_TO_SQUEAK=../../../../../../Squeak5.1-16549-32bit.app
BASE=../../../../../opensmalltalk-vm
PKGLIBS=pangocairo fontconfig

CFLAGS=-m32 \
	   -Wall \
	   -g \
	   -I$(BASE)/platforms/Cross/vm \
	   -I$(BASE)/platforms/Cross/plugins/$(PLUGIN_NAME) \
	   -I../Cross \
	   -I. \
	   -I$(BASE)/platforms/Mac\ OS/vm \
	   -I$(BASE)/src/vm \
	   -I$(BASE)/build.macos32x32/squeak.cog.spur/build \
	   -DLSB_FIRST=1 \
		$(shell pkg-config --cflags $(PKGLIBS))
LDFLAGS=-m32 \
	   -shared \
	   -fPIC
LDLIBS=$(shell pkg-config --libs $(PKGLIBS))
SOURCES += $(BASE)/src/plugins/$(PLUGIN_NAME)/$(PLUGIN_NAME).c ../Cross/PangoPlugin.c
OBJECTS = $(SOURCES:.c=.o)

EXECUTABLE=$(PATH_TO_SQUEAK)/Contents/MacOS/Plugins/$(PLUGIN_NAME)

install: $(EXECUTABLE)

$(EXECUTABLE): $(PLUGIN_NAME)
	cp $(PLUGIN_NAME) $(EXECUTABLE)

$(PLUGIN_NAME): $(OBJECTS)

clean:
	rm -f $(EXECUTABLE) $(PLUGIN_NAME) $(OBJECTS)

LINK_PLATFORM=$(BASE)/platforms/Mac OS/plugins/$(PLUGIN_NAME)
LINK_CROSS=$(BASE)/platforms/Cross/plugins/$(PLUGIN_NAME)
symlink:
	ln -s "$(shell pwd)" "$(LINK_PLATFORM)"
	ln -s "$(shell pwd)/../Cross" "$(LINK_CROSS)"
cleansymlink:
	rm -f "$(LINK_PLATFORM)" "$(LINK_CROSS)"

.PHONY: clean install

