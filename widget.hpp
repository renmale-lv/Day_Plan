#ifndef WIDGET_HPP
#define WIDGET_HPP

#include <QWidget>
#include <QLabel>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QPushButton>
#include <QMouseEvent>
#include <QPoint>

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();

private:
    QLabel* _title_bar;
    QVBoxLayout* _final_layout;
    QPushButton* _quit_button;
    QHBoxLayout* _title_layout;

    //测试函数
    void test();
protected:
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
private slots:
    void on_quit_button_clicked();
};
#endif // WIDGET_HPP
