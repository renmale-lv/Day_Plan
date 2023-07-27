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
    /**
     * @brief 初始化数据库，创建本地数据库和数据库事务等
     */
    static void SqlInit();

    /**
     * @brief 添加事件
     * @return 返回是否成功
     */
    Q_INVOKABLE bool add_event(QString name);
    /**
     * @brief 获得某天的事件信息
     * @return 返回QVarintlist方便QML文件接受
     */
    Q_INVOKABLE QVariantList get_daytodo_event(QDate day);
    /**
     * @brief 改变事件信息
     * @param 事件模型
     */
    Q_INVOKABLE void update_daytodo_event(EventModel model);
    /**
     * @brief 删除事件，直接删除，不留档
     * @param 事件id
     */
    Q_INVOKABLE void delete_daytodo_event(int id);
    /**
     * @brief 改变事件的完成状态
     * @param 事件id
     * @param true表示完成，false表示取消完成
     */
    Q_INVOKABLE void complete_daytodo_event(int id,bool complete);
private:
    static QSqlDatabase db;
    static QSqlQuery query;

};

#endif // SQLSERVER_HPP
