#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "FramelessWindow.hpp"
#include "LunarDateHelper.hpp"
#include "SqlServer.hpp"
#include "EventModel.hpp"

int main(int argc, char *argv[])
{
    SqlServer::SqlInit();

    QGuiApplication app(argc, argv);
    qmlRegisterType<FramelessWindow>("FramelessWindow", 1, 0, "FramelessWindow");
    qmlRegisterType<LunarDateHelper>("LunarDateHelper", 1, 0, "LunarDateHelper");
    qmlRegisterType<SqlServer>("SqlServer", 1, 0, "SqlServer");
    qRegisterMetaType<EventModel>("EventModel");

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/qml/ResizeItem");
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    //退出QML引擎时关闭整个程序
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &QGuiApplication::quit);
    return app.exec();
}
