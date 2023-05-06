#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "CursorPosProvider.hpp"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CursorPosProvider mousePosProvider;
    engine.rootContext()->setContextProperty("mousePosition",&mousePosProvider);

    engine.addImportPath("qrc:/qml/ResizeItem");

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
