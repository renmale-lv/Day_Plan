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

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();

private:
private slots:
};
#endif // WIDGET_HPP
