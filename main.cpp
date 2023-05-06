#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "CursorPosProvider.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Day_Plan/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    CursorPosProvider mousePosProvider;
    QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
    engine.rootContext()->setContextProperty("mousePosition",&mousePosProvider);
    engine.load(url);

    return app.exec();
}
