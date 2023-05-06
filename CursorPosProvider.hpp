#ifndef CURSORPOSPROVIDER_HPP
#define CURSORPOSPROVIDER_HPP

#include <QObject>
#include <QPointF>
#include <QCursor>

/**
 * @brief 鼠标坐标类，暴露给QML上下文属性
 *      解决使用QML实现拖动窗口功能时窗口剧烈抖动的问题
 */

class CursorPosProvider : public QObject
{
    Q_OBJECT
public:
    explicit CursorPosProvider(QObject *parent = nullptr) : QObject(parent){}
    virtual ~CursorPosProvider() = default;
    Q_INVOKABLE QPointF cursorPos(){
        return QCursor::pos();
    }
};

#endif // CURSORPOSPROVIDER_HPP
