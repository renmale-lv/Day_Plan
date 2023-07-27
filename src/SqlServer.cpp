#include "SqlServer.hpp"
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
                            "`detail` TEXT,"
                            "`is_range` TINYINT NOT NULL DEFAULT 0"
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
    QString sql=QString("SELECT `id`,`name`,`statue`,`detail`,`start_time`,`end_time`,`is_range` FROM `daytodo_event` WHERE '%1' BETWEEN date(`start_time`) AND date(`end_time`);").arg(day.toString("yyyy-MM-dd"));
    QVariantList res;
    if(!query.exec(sql)){
        qDebug()<<sql;
        qDebug()<<query.lastError().text();
    }
    while(query.next()){
        EventModel cnt;
        cnt.setId(query.value(0).toInt());
        cnt.setName(query.value(1).toString());
        cnt.setStatue(query.value(2).toInt());
        cnt.setDetail(query.value(3).toString());
        cnt.setStarttime(query.value(4).toDate());
        cnt.setEndtime(query.value(5).toDate());
        cnt.setRange(query.value(6).toBool());
        res.append(QVariant::fromValue(cnt));
    }
    return res;
}

//QVariant SqlServer::get_daytodo_event_byid(int id){
//    QString sql=QString("SELECT `id`,`name`,`statue`,`detail`,`start_time`,`end_time` FROM `daytodo_event` WHERE `id` =%1;").arg(id);
//    query.exec(sql);
//    QVariant res;
//    if(query.next()){
//        EventModel cnt;
//        cnt.setId(query.value(0).toInt());
//        cnt.setName(query.value(1).toString());
//        cnt.setStatue(query.value(2).toInt());
//        cnt.setDetail(query.value(3).toString());
//        cnt.setStarttime(query.value(4).toDate());
//        cnt.setEndtime(query.value(5).toDate());
//        res=QVariant::fromValue(cnt);
//    }
//    return res;
//}

void SqlServer::update_daytodo_event(EventModel model){

    QString sql=QString("UPDATE `daytodo_event` SET `name`='%1',`statue`=%2,`detail`='%3',`start_time`='%4',`end_time`='%5',`is_range`=%6 WHERE `id`=%7;")
        .arg(model.getName()).arg(model.getStatue()).arg(model.getDetail()).arg(model.getStarttime().toString("yyyy-MM-dd")).arg(model.getEndtime().toString("yyyy-MM-dd")).arg(model.getRange()).arg(model.getId());
    if(!query.exec(sql)){
        qDebug()<<sql;
        qDebug()<<query.lastError().text();
    }
}

void SqlServer::delete_daytodo_event(int id){
    QString sql=QString("DELETE FROM `daytodo_event` WHERE `id` = %1;").arg(id);
    if(!query.exec(sql)){
        qDebug()<<sql;
        qDebug()<<query.lastError().text();
    }
}

void SqlServer::complete_daytodo_event(int id, bool complete){
//    QString sql;
//    if(complete){
//        sql=QString();
//    }else{
//        sql=QString();
//    }
//    if(!query.exec(sql)){
//        qDebug()<<sql;
//        qDebug()<<query.lastError().text();
//    }
}


