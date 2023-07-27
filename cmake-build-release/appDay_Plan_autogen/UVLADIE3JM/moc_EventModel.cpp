/****************************************************************************
** Meta object code from reading C++ file 'EventModel.hpp'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../src/EventModel.hpp"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'EventModel.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_EventModel_t {
    const uint offsetsAndSize[16];
    char stringdata0[57];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_EventModel_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_EventModel_t qt_meta_stringdata_EventModel = {
    {
QT_MOC_LITERAL(0, 10), // "EventModel"
QT_MOC_LITERAL(11, 6), // "statue"
QT_MOC_LITERAL(18, 2), // "id"
QT_MOC_LITERAL(21, 4), // "name"
QT_MOC_LITERAL(26, 6), // "detail"
QT_MOC_LITERAL(33, 9), // "starttime"
QT_MOC_LITERAL(43, 7), // "endtime"
QT_MOC_LITERAL(51, 5) // "range"

    },
    "EventModel\0statue\0id\0name\0detail\0"
    "starttime\0endtime\0range"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_EventModel[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       7,   14, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       4,       // flags
       0,       // signalCount

 // properties: name, type, flags
       1, QMetaType::Int, 0x00015103, uint(-1), 0,
       2, QMetaType::Int, 0x00015001, uint(-1), 0,
       3, QMetaType::QString, 0x00015103, uint(-1), 0,
       4, QMetaType::QString, 0x00015103, uint(-1), 0,
       5, QMetaType::QDate, 0x00015103, uint(-1), 0,
       6, QMetaType::QDate, 0x00015103, uint(-1), 0,
       7, QMetaType::Bool, 0x00015103, uint(-1), 0,

       0        // eod
};

void EventModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{

#ifndef QT_NO_PROPERTIES
    if (_c == QMetaObject::ReadProperty) {
        auto *_t = reinterpret_cast<EventModel *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->getStatue(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->getId(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->getName(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->getDetail(); break;
        case 4: *reinterpret_cast< QDate*>(_v) = _t->getStarttime(); break;
        case 5: *reinterpret_cast< QDate*>(_v) = _t->getEndtime(); break;
        case 6: *reinterpret_cast< bool*>(_v) = _t->getRange(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = reinterpret_cast<EventModel *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setStatue(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setName(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setDetail(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setStarttime(*reinterpret_cast< QDate*>(_v)); break;
        case 5: _t->setEndtime(*reinterpret_cast< QDate*>(_v)); break;
        case 6: _t->setRange(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
#endif // QT_NO_PROPERTIES
    (void)_o;
    (void)_id;
    (void)_c;
    (void)_a;
}

const QMetaObject EventModel::staticMetaObject = { {
    nullptr,
    qt_meta_stringdata_EventModel.offsetsAndSize,
    qt_meta_data_EventModel,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_EventModel_t
, QtPrivate::TypeAndForceComplete<int, std::true_type>, QtPrivate::TypeAndForceComplete<int, std::true_type>, QtPrivate::TypeAndForceComplete<QString, std::true_type>, QtPrivate::TypeAndForceComplete<QString, std::true_type>, QtPrivate::TypeAndForceComplete<QDate, std::true_type>, QtPrivate::TypeAndForceComplete<QDate, std::true_type>, QtPrivate::TypeAndForceComplete<bool, std::true_type>, QtPrivate::TypeAndForceComplete<EventModel, std::true_type>



>,
    nullptr
} };

QT_WARNING_POP
QT_END_MOC_NAMESPACE
