#ifndef EVENTMODEL_HPP
#define EVENTMODEL_HPP

#include <QObject>
#include <QString>

class EventModel
{
    Q_GADGET
    Q_PROPERTY(int m_statue READ statue WRITE setStatue)
    Q_PROPERTY(int m_id READ id)
    Q_PROPERTY(QString m_name READ name WRITE setName)
    Q_PROPERTY(QString m_detail READ detail WRITE setDetail)

public:
    explicit EventModel();

    int statue(){return m_statue;}
    void setStatue(int val){m_statue=val;}

    int id(){return m_id;}
    void setId(int val){m_id=val;}

    QString name(){return m_name;}
    void setName(QString val){m_name=val;}

    QString detail(){return m_detail;}
    void setDetail(QString val){m_detail=val;}

private:
    int m_statue;
    int m_id;
    QString m_name;
    QString m_detail;
};

#endif // EVENTMODEL_HPP
