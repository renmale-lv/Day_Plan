﻿#include "SqlServer.hpp"
//静态成员变量定义需要放在CPP文件中，且需放在最前面
QSqlDatabase SqlServer::db=QSqlDatabase::addDatabase("QSQLITE");
QSqlQuery SqlServer::query=QSqlQuery(SqlServer::db);

void SqlServer::SqlInit(){
    db.setDatabaseName("./DayPlan.db");
    if(!db.open()) qDebug()<<db.lastError().text();

    QString sql=QString("CREATE TABLE IF NOT EXISTS `daytodo_event`("
                            "`id` INTEGER PRIMARY KEY AUTOINCREMENT,"
                            "`name` CHAR(100) NOT NULL DEFAULT '事件',"
                            "`statue` TINYINT NOT NULL DEFAULT 0,"
                            "`start_time` DATE NOT NULL DEFAULT (DATETIME('now','localtime')),"
                            "`end_time` DATE NOT NULL DEFAULT (DATETIME('now','localtime')),"
                            "`complete_time` DATE,"
                            "`detail` TEXT"
                        ");");
    if(!query.exec(sql)) qDebug()<<query.lastError().text();

    // 打开外键功能
    sql=QString("PRAGMA foreign_keys = ON;");
    if(!query.exec(sql)) qDebug()<<query.lastError().text();

    sql=QString("CREATE TABLE IF NOT EXISTS `daytodo_sonevent`("
                    "`id` INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "`name` CHAR(100) NOT NULL DEFAULT '子事件',"
                    "`statue` TINYINT NOT NULL DEFAULT 0,"
                    "`parent_index` INT NOT NULL,"
                    "FOREIGN KEY (`parent_index`) REFERENCES `daytodo_event` (`id`) on delete cascade on update cascade"
                ");");
    if(!query.exec(sql)) qDebug()<<query.lastError().text();

    query.finish();
}

SqlServer::SqlServer(QObject *parent)
    : QObject(parent)
{}

bool SqlServer::add_event(QString name){
    QString sql=QString("INSERT INTO `daytodo_event` (`name`) VALUES('%1');").arg(name);
    if(!query.exec(sql)){
        qDebug()<<query.lastError().text();
        query.finish();
        return false;
    }
    query.finish();
    return true;
}

QVariantList SqlServer::get_daytodo_event(QDate day){
    QString sql=QString("SELECT `id`,`name`,`statue`,`detail` FROM `daytodo_event` WHERE '%1' BETWEEN date(`start_time`) AND date(`end_time`);").arg(day.toString("yyyy-MM-dd"));
    qDebug()<<sql;
    QVariantList res;
    query.exec(sql);
    while(query.next()){
        qDebug()<<query.value(0).toInt();
        EventModel cnt;
        cnt.setId(query.value(0).toInt());
        cnt.setName(query.value(1).toString());
        cnt.setStatue(query.value(2).toInt());
        cnt.setDetail(query.value(3).toString());
        res.append(QVariant::fromValue(cnt));
    }
    qDebug()<<res;
    return res;
}