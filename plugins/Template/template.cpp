#include <QDebug>
#include <QString>

#include "stdlib.h"

#include "template.h"

Template::Template() {

}

int Template::exec(const QString& cmd) {

	QByteArray ba = cmd.toLatin1();
	const char *command = ba.data();

	qDebug() << "Exec:  " << command;

	return system(command);
}

bool Template::execbool (const QString& cmd) {

	QByteArray ba = cmd.toLatin1();
	const char *command = ba.data();

	qDebug() << "Exec: (bool) " << command;

	int result = system(command);
	qDebug() << "Exec: (bool) result " << result;

	if (result == 1) {
		return true;
	} else if (result == 0) {
		return false;
	}
	return false;
}
