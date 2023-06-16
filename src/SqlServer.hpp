#ifndef SQLSERVER_HPP
#define SQLSERVER_HPP

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QString>
#include <QDebug>
#include <QVariant>
#include <QVariantList>
#include <QDate>

#include "EventModel.hpp"

class SqlServer : public QObject
{
    Q_OBJECT 
public:
    explicit SqlServer(QObject *parent=nullptr);
    static void SqlInit();

    Q_INVOKABLE bool add_event(QString name);
    Q_INVOKABLE QVariantList get_daytodo_event(QDate day);
    Q_INVOKABLE QVariant get_daytodo_event_byid(int id);
    Q_INVOKABLE void update_daytodo_event(EventModel model);
    Q_INVOKABLE void delete_daytodo_event(int id);
private:
    static QSqlDatabase db;
    static QSqlQuery query;

};

#endif // SQLSERVER_HPP
