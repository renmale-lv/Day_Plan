#ifndef FRAMELESSWINDOW_HPP
#define FRAMELESSWINDOW_HPP

#include <QQuickWindow>

class FramelessWindow : public QQuickWindow
{
    Q_OBJECT

    enum MouseArea {
        TopLeft = 1,
        Top,
        TopRight,
        Left,
        Move,
        Right,
        BottomLeft,
        Bottom,
        BottomRight,
        Client
    };

public:
    explicit FramelessWindow(QWindow *parent=nullptr);

signals:
    void movableChanged();
    void resizableChanged();

protected:
    void mousePressEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;
    void mouseDoubleClickEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;

private:
    MouseArea getArea(const QPoint &pos);
    void setWindowGeometry(const QPoint &pos);
    void setCursorIcon();
    bool m_movable = true;
    MouseArea m_currentArea = Move;
    QPoint m_startPos;
    QPoint m_oldPos;
    QSize m_oldSize;
    QRect m_moveArea = { 80, 8, 130, 25};
};

#endif // FRAMELESSWINDOW_HPP
