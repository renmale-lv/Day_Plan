﻿#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "FramelessWindow.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<FramelessWindow>("FramelessWindow", 1, 0, "FramelessWindow");

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/qml/ResizeItem");
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    //退出QML引擎时关闭整个程序
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &QGuiApplication::quit);
    return app.exec();
}
