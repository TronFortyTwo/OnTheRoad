#include <QDebug>
#include <QString>

#include "template.h"

Template::Template() {
    proc = new QProcess(this);
}

bool Template::execbool (const QString& cmd) {

	qDebug() << "Exec: " << cmd;
	int result = 678;

	// for now empty args
    QStringList args = cmd.split(" ");
    if (args.count() > 0) {
        QString program = args.takeFirst();
	    proc->start(program, args);
	    proc->waitForFinished();
		result = proc->exitCode();
	}
	qDebug() << "Exec: result " << result;

	if (result == 0) {
		return true;
	}
	return false;
}
