#ifndef BUTTOMBAR_HPP
#define BUTTOMBAR_HPP

#include <QWidget>
#include <QHBoxLayout>
#include <QButtonGroup>

#include "NewRadioButton.hpp"

class ButtomBar : public QWidget
{
    Q_OBJECT
public:
    explicit ButtomBar(QWidget *parent = nullptr);
private:
    QHBoxLayout* _final_layout;
    NewRadioButton* test;
    NewRadioButton* test1;
    QButtonGroup* _button_group;
signals:

};

#endif // BUTTOMBAR_HPP
