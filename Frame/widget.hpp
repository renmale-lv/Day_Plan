#ifndef WIDGET_HPP
#define WIDGET_HPP

#include <QWidget>
#include <QLabel>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QPushButton>
#include <QMouseEvent>
#include <QPoint>
#include <QTabWidget>
#include <QTabBar>
#include <QEvent>
#include <QMouseEvent>
#include <QPoint>

#include "TitleBar.hpp"
#include "Windows.h"

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);

private:
    //标题栏
    TitleBar* _title_bar;
    //布局
    QVBoxLayout* _final_layout;
private slots:
    //重载拖动标题栏改变位置
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
    bool eventFilter(QObject *watched, QEvent *event);
    //重载拖动软件边缘改变大小
    bool nativeEvent(const QByteArray &eventType, void *message, long *result);
};
#endif // WIDGET_HPP
