#ifndef TITLEBAR_HPP
#define TITLEBAR_HPP

#include <QWidget>
#include <QLabel>
#include <QPushButton>
#include <QHBoxLayout>
#include <QPixmap>
#include <QStyle>
#include <QPalette>
#include <QColor>

class TitleBar : public QWidget
{
    Q_OBJECT
public:
    explicit TitleBar(QWidget *parent = nullptr);

    QPushButton* _quit_button;
    QPushButton* _mmin_button;
    QPushButton* _mmax_button;
private:
    QLabel* _logo;
    QHBoxLayout* _final_layout;

private slots:
signals:

};

#endif // TITLEBAR_HPP
