#ifndef FRAMELESSWINDOW_HPP
#define FRAMELESSWINDOW_HPP

#include <QQuickWindow>

/**
 * @brief 无边框窗口类，实现移动和拖动改变窗口大小
 *  借鉴@mengps大佬的代码
 *  地址：https://github.com/mengps/QmlControls
 */

class FramelessWindow : public QQuickWindow
{
    Q_OBJECT
    Q_PROPERTY(bool movable READ movable WRITE setMovable NOTIFY movableChanged)
    Q_PROPERTY(bool resizable READ resizable WRITE setResizable NOTIFY resizableChanged)

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
    bool movable() const;
    void setMovable(bool arg);
    bool resizable() const;
    void setResizable(bool arg);

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
    bool m_resizable = true;
    MouseArea m_currentArea = Move;
    QPoint m_startPos;
    QPoint m_oldPos;
    QSize m_oldSize;
    QRect m_moveArea = { 80, 8, 130, 25};
};

#endif // FRAMELESSWINDOW_HPP
