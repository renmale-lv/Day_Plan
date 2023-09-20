#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>

#include "framelesswindow.hpp"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<FramelessWindow>("Test",1,0,"FramelessWindow");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:Qml/Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
