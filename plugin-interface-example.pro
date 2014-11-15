# Shared library without any Qt functionality
TEMPLATE = lib
QT -= gui core

CONFIG += warn_on plugin debug c++11
CONFIG -= thread exceptions qt rtti

VERSION = 1.0.0

# These paths can be changed to match the location of the XPLM headers
INCLUDEPATH += ../SDK/CHeaders/XPLM
INCLUDEPATH += ../SDK/CHeaders/Wrappers
INCLUDEPATH += ../SDK/CHeaders/Widgets

# Specify the plugin class name
# The plugin interface code uses this to initialize the correct plugin class.
DEFINES += PLUGIN_CLASS_NAME=ExamplePlugin
# Specify the plugin header file name
DEFINES += PLUGIN_HEADER_NAME=exampleplugin.h

# Defined to use X-Plane SDK 2.0 capabilities - no backward compatibility before 9.0
DEFINES += XPLM200
# Defined to use X-Plane SDK 2.1 capabilities - no backward compatibility before 10.0
DEFINES += XPLM210

win32 {
        DEFINES += APL=0 IBM=1 LIN=0
        LIBS += -L../SDK/Libraries/Win
        LIBS += -lXPLM -lXPWidgets
        TARGET = win.xpl
}

unix:!macx {
        DEFINES += APL=0 IBM=0 LIN=1
        TARGET = lin.xpl
        # WARNING! This requires the latest version of the X-SDK !!!!
        QMAKE_CXXFLAGS += -fvisibility=hidden
}

macx {
        DEFINES += APL=1 IBM=0 LIN=0
        TARGET = mac.xpl
        QMAKE_LFLAGS += -flat_namespace -undefined suppress

        # Build for multiple architectures.
        # The following line is only needed to build universal on PPC architectures.
        # QMAKE_MAC_SDK=/Developer/SDKs/MacOSX10.4u.sdk
        # The following line defines for which architectures we build.
        CONFIG += x86 # ppc

	QMAKE_MAC_SDK = macosx
}

SOURCES += \
    plugin-interface/plugin.cpp \
    plugin-interface/plugin_main.cpp \
    exampleplugin.cpp

HEADERS += \
    plugin-interface/plugin.h \
    exampleplugin.h

