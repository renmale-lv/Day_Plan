#include "TitleBar.hpp"

TitleBar::TitleBar(QWidget *parent)
    : QWidget{parent}
{
    this->setFixedHeight(30);
    QPalette pal(this->palette());
    pal.setColor(QPalette::Background,QColor(203,241,245));
    this->setAutoFillBackground(true);
    this->setPalette(pal);

    _quit_button=new QPushButton(this);
    _mmin_button=new QPushButton(this);
    _mmax_button=new QPushButton(this);
    _final_layout=new QHBoxLayout(this);
    _logo=new QLabel(this);

    _quit_button->setFixedSize(40,30);
    _mmin_button->setFixedSize(40,30);
    _mmax_button->setFixedSize(40,30);

    _quit_button->setIcon(style()->standardPixmap(QStyle::SP_TitleBarCloseButton));
    _mmin_button->setIcon(style()->standardPixmap(QStyle::SP_TitleBarMinButton));
    _mmax_button->setIcon(style()->standardPixmap(QStyle::SP_TitleBarMaxButton));
    QString style_1="QPushButton{background:transparent;border:0px;}QPushButton::hover{background-color:rgb(255,0,0);}QPushButton::pressed{background-color:rgb(241,112,122);}";
    QString style_2="QPushButton{background:transparent;border:0px;}QPushButton::hover{background-color:rgb(224,224,224);}QPushButton::pressed{background-color:rgb(202,202,203);}";
    _quit_button->setStyleSheet(style_1);
    _mmin_button->setStyleSheet(style_2);
    _mmax_button->setStyleSheet(style_2);

    QPixmap img;
    img.load(":/img/logo.png");
    _logo->setPixmap(img);
    _logo->setScaledContents(true);
    _logo->setFixedWidth(200);

    _final_layout->addWidget(_logo);
    _final_layout->addStretch();
    _final_layout->addWidget(_mmin_button);
    _final_layout->addWidget(_mmax_button);
    _final_layout->addWidget(_quit_button);
    _final_layout->setSpacing(0);
    _final_layout->setMargin(0);
    this->setLayout(_final_layout);

    connect(_quit_button,&QPushButton::clicked,parent,&QWidget::close);
    connect(_mmin_button,&QPushButton::clicked,parent,&QWidget::showMinimized);
    connect(_mmax_button,&QPushButton::clicked,parent,[=](){
        if(parent->windowState()==Qt::WindowMaximized){
            parent->showNormal();
            _mmax_button->setIcon(style()->standardPixmap(QStyle::SP_TitleBarMaxButton));
        }else{
            parent->showMaximized();
            _mmax_button->setIcon(style()->standardPixmap(QStyle::SP_TitleBarNormalButton));
        }
    });
}

