#ifndef TEMPLATE_H
#define TEMPLATE_H

#include <QObject>
#include <QProcess>

class Template: public QObject {
	Q_OBJECT

public:
	Template();
	~Template() = default;

	Q_INVOKABLE bool execbool(const QString&);

private:
    QProcess *proc;
};

#endif
