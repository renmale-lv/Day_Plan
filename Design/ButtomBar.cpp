#include "ButtomBar.hpp"

ButtomBar::ButtomBar(QWidget *parent)
    : QWidget{parent}
{
    this->setFixedHeight(50);
    this->setAttribute(Qt::WA_StyledBackground);
    this->setStyleSheet("background-color:rgb(0,0,0);");

    _button_group=new QButtonGroup(this);

    test=new NewRadioButton("");
    test1=new NewRadioButton("");
    _button_group->addButton(test);
    _button_group->addButton(test1);

    _final_layout=new QHBoxLayout(this);
    _final_layout->addStretch();
    _final_layout->addWidget(test);
    _final_layout->addWidget(test1);
    _final_layout->addStretch();
    _final_layout->setMargin(0);
    _final_layout->setAlignment(Qt::AlignCenter);
    this->setLayout(_final_layout);
}
