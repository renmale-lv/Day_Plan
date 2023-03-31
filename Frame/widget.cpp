#include "widget.hpp"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    this->setMinimumSize(1280,800);
    this->setWindowFlags(Qt::FramelessWindowHint);
    this->move(100,200);
    _final_layout=new QVBoxLayout(this);

    _title_bar=new TitleBar(this);
    _title_bar->installEventFilter(this);

    _buttom_bar=new ButtomBar(this);
    _buttom_bar->installEventFilter(this);

    _tab_widget=new QTabWidget(this);
    _tab_widget->installEventFilter(this);
    _tab_widget->tabBar()->hide();

    _home_page=new MainPage(this);
    _overview_page=new OverViewWidget(this);

    _tab_widget->addTab(_home_page,"home");
    _tab_widget->addTab(_overview_page,"overview");

    _final_layout->addWidget(_title_bar);
    _final_layout->addWidget(_tab_widget);
    _final_layout->addWidget(_buttom_bar);
    _final_layout->setMargin(0);
    _final_layout->setSpacing(0);
    this->setLayout(_final_layout);

    connect(_buttom_bar,&ButtomBar::button_toggled,_tab_widget,&QTabWidget::setCurrentIndex);
}

static QPoint last(100,200);
static bool _move_flag=false;
void Widget::mousePressEvent(QMouseEvent *event){
    _move_flag=true;
    last=event->globalPos();
}

void Widget::mouseMoveEvent(QMouseEvent *event){
    if(!_move_flag) return;
    int dx=event->globalX()-last.x();
    int dy=event->globalY()-last.y();
    last=event->globalPos();
    this->move(this->x()+dx,this->y()+dy);
}

void Widget::mouseReleaseEvent(QMouseEvent *event){
    Q_UNUSED(event);
    _move_flag=false;
}

bool Widget::eventFilter(QObject *watched, QEvent *event){
    Q_UNUSED(event);
    if(watched == _title_bar) return false;
    return true;
}

bool Widget::nativeEvent(const QByteArray &eventType, void *message, long *result){
    MSG* pMsg = (MSG*)message;
    switch (pMsg->message)
    {
    case WM_NCHITTEST:
    {
        QPoint pos = mapFromGlobal(QPoint(LOWORD(pMsg->lParam), HIWORD(pMsg->lParam)));
        bool bHorLeft = pos.x() < 4;
        bool bHorRight = pos.x() > width() - 4;
        bool bVertTop = pos.y() < 4;
        bool bVertBottom = pos.y() > height() - 4;
        if (bHorLeft && bVertTop){
            *result = HTTOPLEFT;
        }else if (bHorLeft && bVertBottom){
            *result = HTBOTTOMLEFT;
        }else if (bHorRight && bVertTop){
            *result = HTTOPRIGHT;
        }else if (bHorRight && bVertBottom){
            *result = HTBOTTOMRIGHT;
        }else if (bHorLeft){
            *result = HTLEFT;
        }else if (bHorRight){
            *result = HTRIGHT;
        }else if (bVertTop){
            *result = HTTOP;
        }else if (bVertBottom){
            *result = HTBOTTOM;
        }else{
            return false;
        }
        return true;
    }
        break;
    default:
        break;
    }
    return QWidget::nativeEvent(eventType, message, result);
}
