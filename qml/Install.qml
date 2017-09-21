import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Template 1.0

Page {
	id: install
	visible: false
	header: PageHeader {
		title: i18n.tr('On The Road')
		id: header
	}
	
	Flickable {
		anchors {
			top: header.bottom
			left: parent.left
			right: parent.right
			bottom: parent.bottom
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
				text: i18n.tr("On The Road is a tool to easily develop applications inside Ubuntu Touch devices. It uses containers to create development environment where the hacker can act like in a standard environment. It also fully integrates with Libertine and its containers.<br>THIS IS STILL ALPHA SOFTWARE! THERE IS NO WARRANTY OF ANY KIND.<br>As far as now the CLI tool is available, while the graphic interface is still work in progress. Once the CLI tool is installed you can use On The Road opening the Terminal-App or any other shell and typing the command 'otr-ssh' to enter the AppArmor free shell, then you can launch the On The Road CLI with 'otr'")
			}

			Button {
				id: bone
				text: i18n.tr("Install CLI tool")
				onClicked: {
					var installed = Template.execbool("/bin/sh /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/install.sh");
					if (installed) {
						text = i18n.tr("CLI tool is now installed");
						color = UbuntuColors.green;
					}
					else {
						text = i18n.tr("Unable to install");
						color = UbuntuColors.orange;
					}
				}
				visible: ! flick.isinstalled
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
				color: UbuntuColors.red
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
				text: i18n.tr("This software is licensed under the GNU GPLv3 license as published by the Free Software Foundation.<br>Copyright (c) 2017 Emanuele Sorce<br>The code is hosted in github: https://github.com/TronFourtyTwo/OnTheRoad")
			}

			Label {
				width: parent.width
				wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				text: i18n.tr("There are many way to help this app to improve and get more useful: your feedback is much appreciated, bug listing and feature requests are very important and if you like this app, consider doing a donation to incourage and help the developer.<br>Contact me (Emanuele Sorce):<br>e-mail: emanuele.sorce@hotmail.com<br>Telegram: @TronFourtyTwo")
			}
		}
	}
	Scrollbar {
		flickableItem: flick
		align: Qt.AlignTrailing
	}
}

