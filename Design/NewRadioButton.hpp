#ifndef NEWRADIOBUTTON_HPP
#define NEWRADIOBUTTON_HPP

#include <QObject>
#include <QRadioButton>
#include <QString>
#include <QPainter>
#include <QPen>
#include <QPaintEvent>
#include <QMouseEvent>
#include <QPixmap>
#include <QEvent>
#include <QColor>

class NewRadioButton : public QRadioButton
{
    Q_OBJECT
public:
    NewRadioButton(QString path);
public slots:
private:
    //QT枚举好麻烦
//    enum state{IN, OUT=0, SELECTED} _state;

    int _state;
    QString _path;
private slots:
    void paintEvent(QPaintEvent *);
    void enterEvent(QEvent *event);
    void leaveEvent(QEvent *event);
    void check(bool);
};

#endif // NEWRADIOBUTTON_HPP
