#include <QString>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QProcess>

class Settings : public QObject {
    Q_OBJECT

private:
    QString _https_proxy;
    QString _no_proxy;

public:
    Q_INVOKABLE void set_proxy(QString https_proxy, QString no_proxy);

};
