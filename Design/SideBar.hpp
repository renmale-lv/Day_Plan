#ifndef SIDEBAR_HPP
#define SIDEBAR_HPP

#include <QWidget>
#include <QRadioButton>
#include <QVBoxLayout>
#include <QButtonGroup>

class SideBar : public QWidget
{
    Q_OBJECT
public:
    explicit SideBar(QWidget *parent = nullptr);
private:
    QVBoxLayout* _final_layout;
    QButtonGroup* _button_group;

signals:

};

#endif // SIDEBAR_HPP
