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

	if (result == 0)
		return false;
	else
		return true;
}
