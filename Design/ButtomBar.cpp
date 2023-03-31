#include "ButtomBar.hpp"

ButtomBar::ButtomBar(QWidget *parent)
    : QWidget{parent}
{
    this->setFixedHeight(50);
    this->setAttribute(Qt::WA_StyledBackground);
    this->setStyleSheet("background-color:rgb(203,241,245);");

    _button_group=new QButtonGroup(this);

    _home_button=new NewRadioButton(":/img/home.png");
    _overview_button=new NewRadioButton(":/img/chart-pie.png");
    _button_group->addButton(_home_button);
    _button_group->addButton(_overview_button);

    _final_layout=new QHBoxLayout(this);
    _final_layout->addStretch();
    _final_layout->addWidget(_home_button);
    _final_layout->addWidget(_overview_button);
    _final_layout->addStretch();
    _final_layout->setMargin(0);
    _final_layout->setAlignment(Qt::AlignCenter);
    this->setLayout(_final_layout);

    connect(_button_group,&QButtonGroup::idToggled,this,&ButtomBar::on_button_clicked);
}

void ButtomBar::on_button_clicked(int index, bool flag)
{
    if(!flag) return;
    emit button_toggled(index);
}
