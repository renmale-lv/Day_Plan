// This file is autogenerated by CMake. Do not edit.

#include <QtQml/qqmlextensionplugin.h>

extern void qml_register_types_Qml();
Q_GHS_KEEP_REFERENCE(qml_register_types_Qml);

class QmlPlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

public:
    QmlPlugin(QObject *parent = nullptr) : QQmlEngineExtensionPlugin(parent)
    {
        volatile auto registration = &qml_register_types_Qml;
        Q_UNUSED(registration);
    }
};



#include "Noobplugin_QmlPlugin.moc"
