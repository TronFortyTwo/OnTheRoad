#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "template.h"

void TemplatePlugin::registerTypes(const char *uri) {
    //@uri Template
    qmlRegisterSingletonType<Template>(uri, 1, 0, "Template", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Template; });
}
