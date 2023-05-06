#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "CursorPosProvider.hpp"
#include "FramelessWindow.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<FramelessWindow>("FramelessWindow", 1, 0, "FramelessWindow");

    QQmlApplicationEngine engine;
    CursorPosProvider mousePosProvider;
    engine.rootContext()->setContextProperty("mousePosition",&mousePosProvider);

    engine.addImportPath("qrc:/qml/ResizeItem");

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
