QT += quick
#virtualkeyboard

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp backend/appsmenu.cpp backend/stats.cpp backend/benchmarks.cpp backend/camera_recorder.cpp backend/gpu_performance.cpp backend/live_camera.cpp utils/perf_stats.cpp backend/deviceinfo.cpp
SOURCES += backend/run_cmd.cpp backend/settings.cpp backend/arm_analytics.cpp
CONFIG += debug_and_release

RESOURCES += qml.qrc
QT += multimedia

QML_IMPORT_NAME = io.qt.examples.backend
QML_IMPORT_MAJOR_VERSION = 1

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += backend/includes/common.h
HEADERS += backend/includes/camera_recorder.h
HEADERS += backend/includes/live_camera.h
HEADERS += backend/includes/benchmarks.h
HEADERS += backend/includes/gpu_performance.h
HEADERS += backend/includes/stats.h
HEADERS += backend/includes/appsmenu.h
HEADERS += utils/includes/perf_stats.h
HEADERS += backend/includes/run_cmd.h
HEADERS += backend/includes/settings.h
HEADERS += backend/includes/deviceinfo.h
HEADERS += backend/includes/arm_analytics.h

