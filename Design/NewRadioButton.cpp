#include "NewRadioButton.hpp"

NewRadioButton::NewRadioButton(QString path)
{
    _path=path;_state=0;
    this->setFixedSize(40,40);
    //取消QRadioButton前面小圆点
    this->setStyleSheet("QRadioButton::indicator{width:0px;height:0px;}");

    connect(this,&NewRadioButton::toggled,this,&NewRadioButton::check);
}

void NewRadioButton::paintEvent(QPaintEvent *){
    QPainter painter(this);
    //设置抗锯齿
    painter.setRenderHint(QPainter::Antialiasing);
    //设置画笔
    QPen pen(QColor(255,255,255));
    pen.setWidth(3);
    painter.setPen(pen);

    if(!_state){
        //OUT
        painter.drawEllipse(QPoint(20,20),16,16);
    }else if(_state==1){
        //IN
        painter.drawEllipse(QPoint(20,20),18,18);
    }else{
        //SELECTED
        painter.drawEllipse(QPoint(20,20),18,18);
    }
}

void NewRadioButton::enterEvent(QEvent *event){
    Q_UNUSED(event);
    if(_state==2) return;
    _state=1;
    update();
}

void NewRadioButton::leaveEvent(QEvent *event){
    Q_UNUSED(event);
    if(_state==2) return;
    _state=0;
    update();
}

void NewRadioButton::check(bool flag){
    if(flag) _state=2;
    else _state=0;
    update();
}
