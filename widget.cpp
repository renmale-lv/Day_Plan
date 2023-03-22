#include "widget.hpp"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    this->setMinimumSize(1280,720);
    this->setWindowFlag(Qt::FramelessWindowHint);
    this->setStyleSheet("background-color:rgb(233,232,227);");
    _final_layout=new QVBoxLayout(this);
    this->move(100,200);

    // ====== 标题栏 ======
    _title_layout=new QHBoxLayout(this);
    _title_bar=new QLabel(this);
    _title_bar->setMinimumHeight(25);
    _title_bar->setMaximumHeight(25);
    _title_layout->addWidget(_title_bar);
    _quit_button=new QPushButton(this);
    _quit_button->setMaximumSize(30,25);
    _quit_button->setMinimumSize(30,25);
    _title_layout->addWidget(_quit_button);
    _title_layout->setSpacing(0);
    _title_layout->setMargin(0);
    _final_layout->addLayout(_title_layout);
    _final_layout->setMargin(0);


    // ====== 槽函数链接 ======
    connect(_quit_button,&QPushButton::clicked,this,&Widget::on_quit_button_clicked);

    test();
}

Widget::~Widget()
{
}

void Widget::on_quit_button_clicked(){
    this->close();
}

static QPoint last(100,200);
void Widget::mousePressEvent(QMouseEvent *event){
    if(event->y()<25) last=event->globalPos();
}

void Widget::mouseMoveEvent(QMouseEvent *event){
    if(event->y()<25){
        int dx=event->globalX()-last.x();
        int dy=event->globalY()-last.y();
        last=event->globalPos();
        this->move(this->x()+dx,this->y()+dy);
    }
}

void Widget::test(){
    _title_bar->setStyleSheet("background-color:#000000;");
    _quit_button->setStyleSheet("background-color:red;");
    _final_layout->addStretch();
}

