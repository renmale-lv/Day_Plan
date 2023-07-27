/****************************************************************************
** Meta object code from reading C++ file 'SqlServer.hpp'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../src/SqlServer.hpp"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SqlServer.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SqlServer_t {
    const uint offsetsAndSize[26];
    char stringdata0[142];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_SqlServer_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_SqlServer_t qt_meta_stringdata_SqlServer = {
    {
QT_MOC_LITERAL(0, 9), // "SqlServer"
QT_MOC_LITERAL(10, 9), // "add_event"
QT_MOC_LITERAL(20, 0), // ""
QT_MOC_LITERAL(21, 4), // "name"
QT_MOC_LITERAL(26, 17), // "get_daytodo_event"
QT_MOC_LITERAL(44, 3), // "day"
QT_MOC_LITERAL(48, 20), // "update_daytodo_event"
QT_MOC_LITERAL(69, 10), // "EventModel"
QT_MOC_LITERAL(80, 5), // "model"
QT_MOC_LITERAL(86, 20), // "delete_daytodo_event"
QT_MOC_LITERAL(107, 2), // "id"
QT_MOC_LITERAL(110, 22), // "complete_daytodo_event"
QT_MOC_LITERAL(133, 8) // "complete"

    },
    "SqlServer\0add_event\0\0name\0get_daytodo_event\0"
    "day\0update_daytodo_event\0EventModel\0"
    "model\0delete_daytodo_event\0id\0"
    "complete_daytodo_event\0complete"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SqlServer[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   44,    2, 0x02,    1 /* Public */,
       4,    1,   47,    2, 0x02,    3 /* Public */,
       6,    1,   50,    2, 0x02,    5 /* Public */,
       9,    1,   53,    2, 0x02,    7 /* Public */,
      11,    2,   56,    2, 0x02,    9 /* Public */,

 // methods: parameters
    QMetaType::Bool, QMetaType::QString,    3,
    QMetaType::QVariantList, QMetaType::QDate,    5,
    QMetaType::Void, 0x80000000 | 7,    8,
    QMetaType::Void, QMetaType::Int,   10,
    QMetaType::Void, QMetaType::Int, QMetaType::Bool,   10,   12,

       0        // eod
};

void SqlServer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SqlServer *>(_o);
        (void)_t;
        switch (_id) {
        case 0: { bool _r = _t->add_event((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: { QVariantList _r = _t->get_daytodo_event((*reinterpret_cast< std::add_pointer_t<QDate>>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 2: _t->update_daytodo_event((*reinterpret_cast< std::add_pointer_t<EventModel>>(_a[1]))); break;
        case 3: _t->delete_daytodo_event((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 4: _t->complete_daytodo_event((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<bool>>(_a[2]))); break;
        default: ;
        }
    }
}

const QMetaObject SqlServer::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_SqlServer.offsetsAndSize,
    qt_meta_data_SqlServer,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_SqlServer_t
, QtPrivate::TypeAndForceComplete<SqlServer, std::true_type>

, QtPrivate::TypeAndForceComplete<bool, std::false_type>, QtPrivate::TypeAndForceComplete<QString, std::false_type>, QtPrivate::TypeAndForceComplete<QVariantList, std::false_type>, QtPrivate::TypeAndForceComplete<QDate, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<EventModel, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<int, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<int, std::false_type>, QtPrivate::TypeAndForceComplete<bool, std::false_type>

>,
    nullptr
} };


const QMetaObject *SqlServer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SqlServer::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SqlServer.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int SqlServer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
