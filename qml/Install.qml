import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Template 1.0

BasePage {
	id: install
	visible: false
	title: i18n.tr('On The Road')
	
	Flickable {
        anchors {
            fill: parent
            margins: units.gu(2)
        }

		id: flick

		property var isinstalled: false
		property var isupdated: false
		
		Component.onCompleted: {
			flick.isinstalled = Template.execbool("/bin/sh /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/isinstalled.sh")
			flick.isupdated = Template.execbool("/bin/sh /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/isupdated.sh")
			console.log("isinstalled: " + flick.isinstalled)
			console.log("isupdated: " + flick.isupdated)
		}
		
		clip: true
		contentHeight: contentColumn.height + units.gu(4)
		flickableDirection: Flickable.VerticalFlick

		Column {
			id: contentColumn
			anchors {
				left: parent.left
				top: parent.top
				right: parent.right
				margins: units.gu(2)
			}
			width: parent.parent.width

			spacing: units.gu(2)

			Label {
				width: parent.width
				wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				text: i18n.tr("On The Road is a tool to easily develop applications inside Ubuntu Touch devices. It uses containers to create development environment where the hacker can act like in a standard environment. It also fully integrates with Libertine and its containers.<br>THERE IS NO WARRANTY OF ANY KIND<br>Once the CLI tool is installed you can use On The Road opening the Terminal-App or any other shell and just typing 'otr' to launch the command line interface of the app.")
			}

			Button {
				id: bone
				text: i18n.tr("Install CLI tool")
				onClicked: {
					var installed = Template.execbool("/bin/sh /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/install.sh");
					if (installed) {
						visible = false;
						b.visible = true;
					}
					else {
						visible = false;
						fail.visible = true;
					}
				}
				visible: ! flick.isinstalled
			}

			Label {
				id: fail
				text: i18n.tr("<b>CLI tool failed to install! See log file for details</b>");
				color: UbuntuColors.red
				visible: false
			}

			Label {
				id: b
				text: i18n.tr("<b>CLI tool is installed</b>");
				color: UbuntuColors.green
				visible: flick.isinstalled
			}

			Label {
				id: d
				visible: false
				text: i18n.tr("<b>CLI tool is now updated</b>")
				color: UbuntuColors.green
			}

			Button {
				text: i18n.tr("Update CLI tool to latest version")
				id: btwo
				color: UbuntuColors.green
				visible: flick.isinstalled && !flick.isupdated
				onClicked: {
					Template.execbool("/bin/sh /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/update.sh")
					visible = false
					d.visible = true
				}
			}

			Label {
				width: parent.width
				wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				text: i18n.tr("This software is licensed under the GNU GPLv3 license as published by the Free Software Foundation.<br>Copyright (c) 2017 Emanuele Sorce<br>The code is hosted in github: https://github.com/TronFortyTwo/OnTheRoad")
			}

			Label {
				width: parent.width
				wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				text: i18n.tr("There are many way to help this app to improve and get more useful: your feedback is much appreciated, bug listing and feature requests are very important and if you like this app, consider doing a donation to incourage and help the developer.<br>Contact me (Emanuele Sorce):<br>e-mail: emanuele.sorce@hotmail.com<br>Telegram: @TronFortyTwo")
			}
		}
	}
	Scrollbar {
		flickableItem: flick
		align: Qt.AlignTrailing
	}
}

