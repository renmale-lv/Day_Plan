// This file is autogenerated by CMake. Do not edit.

#include <QtQml/qqmlextensionplugin.h>

extern void qml_register_types___();
Q_GHS_KEEP_REFERENCE(qml_register_types___);

class __Plugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

public:
    __Plugin(QObject *parent = nullptr) : QQmlEngineExtensionPlugin(parent)
    {
        volatile auto registration = &qml_register_types___;
        Q_UNUSED(registration);
    }
};



#include "Noobplugin___Plugin.moc"
