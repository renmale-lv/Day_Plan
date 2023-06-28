#ifndef EVENTMODEL_HPP
#define EVENTMODEL_HPP

#include <QObject>
#include <QString>
#include <QDate>

class EventModel
{
    Q_GADGET
    Q_PROPERTY(int statue READ getStatue WRITE setStatue)
    Q_PROPERTY(int id READ getId)
    Q_PROPERTY(QString name READ getName WRITE setName)
    Q_PROPERTY(QString detail READ getDetail WRITE setDetail)
    Q_PROPERTY(QDate starttime READ getStarttime WRITE setStarttime)
    Q_PROPERTY(QDate endtime READ getEndtime WRITE setEndtime)
    Q_PROPERTY(bool range READ getRange WRITE setRange)

public:
    explicit EventModel();

    int getStatue(){return statue;}
    void setStatue(int val){statue=val;}

    int getId(){return id;}
    void setId(int val){id=val;}

    QString getName(){return name;}
    void setName(QString val){name=val;}

    QString getDetail(){return detail;}
    void setDetail(QString val){detail=val;}

    QDate getStarttime(){return starttime;}
    void setStarttime(QDate val){starttime=val;}

    QDate getEndtime(){return endtime;}
    void setEndtime(QDate val){endtime=val;}

    bool getRange(){return range;}
    void setRange(bool val){range=val;}

private:
    int statue;
    int id;
    QString name;
    QString detail;
    QDate starttime;
    QDate endtime;
    bool range;
};

#endif // EVENTMODEL_HPP
