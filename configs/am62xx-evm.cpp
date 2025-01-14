/* Configuration file for AM62x and AM62x-LP */

#include <iostream>
#include "backend/includes/common.h"
#include "backend/includes/live_camera.h"
#include "backend/includes/arm_analytics.h"
#include "backend/includes/run_cmd.h"
#include "backend/includes/settings.h"
#include "backend/includes/gpu_performance.h"
#include "backend/includes/benchmarks.h"

#define PLATFORM "am62xx-evm"
using namespace std;
int include_apps_count = 9;
QString platform = "am62xx-evm";

app_info include_apps[] = {
    {
        .qml_source = "industrial_control.qml",
        .name = "Industrial HMI",
        .icon_source = "qrc:/images/hmi.png"
    },
    {
        .qml_source = "live_camera.qml",
        .name = "Live Camera",
        .icon_source = "qrc:/images/camera.png"
    },
    {
        .qml_source = "arm_analytics.qml",
        .name = "ARM Analytics",
        .icon_source = "qrc:/images/analytics.png"
    },
    {
        .qml_source = "benchmarks.qml",
        .name = "Benchmarks",
        .icon_source = "qrc:/images/benchmarks.png"
    },
    {
        .qml_source = "gpu_performance.qml",
        .name = "GPU Performance",
        .icon_source = "qrc:/images/gpu_performance.png"
    },
    {
        .qml_source = "docker_app.qml",
        .name = "Docker",
        .icon_source = "qrc:/images/docker.png"
    },
    {
        .qml_source = "flutter_app.qml",
        .name = "flutter",
        .icon_source = "qrc:/images/flutter.png"
    },
    {
        .qml_source = "3d_demo.qml",
        .name = "3D Demo",
        .icon_source = "qrc:/images/3d.png"
    },
    {
        .qml_source = "settings.qml",
        .name = "Settings",
        .icon_source = "qrc:/images/settings.png"
    }
};

Settings settings;
LiveCamera live_camera;
ArmAnalytics arm_analytics;
Benchmarks benchmarks;
Gpu_performance gpuperformance;

RunCmd *docker_app = new RunCmd(QStringLiteral("/bin/bash /usr/bin/pyqt5.sh"));
RunCmd *flutter_app = new RunCmd(QStringLiteral("/bin/bash /usr/bin/flutter_app.sh"));
RunCmd *demo_3d = new RunCmd(QStringLiteral("/bin/bash /usr/bin/OpenGL.sh"));

void platform_setup(QQmlApplicationEngine *engine) {
    std::cout << "Running Platform Setup of AM62x!" << endl;
    engine->rootContext()->setContextProperty("live_camera", &live_camera);
    engine->rootContext()->setContextProperty("arm_analytics", &arm_analytics);
    engine->rootContext()->setContextProperty("docker_app", docker_app);
    engine->rootContext()->setContextProperty("flutter_app", flutter_app);
    engine->rootContext()->setContextProperty("demo_3d", demo_3d);
    engine->rootContext()->setContextProperty("settings", &settings);
    engine->rootContext()->setContextProperty("benchmarks", &benchmarks);
    engine->rootContext()->setContextProperty("gpuperformance", &gpuperformance);

    docker_load_images();
}

