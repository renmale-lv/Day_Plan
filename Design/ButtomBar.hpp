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
    NewRadioButton* _home_button;
    NewRadioButton* _overview_button;
    QButtonGroup* _button_group;
signals:
    void button_toggled(int);
private slots:
    void on_button_clicked(int,bool);
};

#endif // BUTTOMBAR_HPP
