#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "DeviceViewer.hpp"
#include "DevicesModel.hpp"

int main(int argc, char *argv[]) {
#if QT_VERSION_MAJOR < 6
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<DeviceViewer>("middleWare", 1, 0, "DeviceViewer");
    qmlRegisterType<DevicesModel>("middleWare", 1, 0, "DevicesModel");
    qmlRegisterSingletonType(QUrl("qrc:/Colors.qml"), "MyColorsModule", 1, 0, "Colors");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
