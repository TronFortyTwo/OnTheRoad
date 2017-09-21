import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Page {
    id: basepage

    head.actions: [
        Action {
            iconName: "info"
            text: i18n.tr("About")
            onTriggered: {
                pageStack.push(about);
            }
        }
    ]
}
