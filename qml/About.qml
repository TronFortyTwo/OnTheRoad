import QtQuick 2.4
import Ubuntu.Components 1.3 // XXX 1.1 has back buttons oO
import QtQuick.Layouts 1.1

Page {
   title: i18n.tr("About")
   id: about
   visible: false

   Flickable {
      id: flickable
      anchors  {
          fill: parent
          margins: units.gu(2)
      }
      contentHeight: contentItem.childrenRect.height

      Column {
         id: col
         anchors.top: parent.top
         anchors.left: parent.left
         anchors.right: parent.right
         anchors.margins: units.gu(2)
         spacing: units.gu(1)

         Label {
            width: parent.width
            horizontalAlignment: Text.Center
            text: i18n.tr('On The Road')
            fontSize: "x-large"
         }

         RowLayout {
            width: parent.width
            UbuntuShape {
               Layout.alignment: Qt.AlignHCenter
               width: units.gu(128)
               height: units.gu(128)
               image: Image {
                  source: "../assets/ontheroad.svg"
               }
            }
         }

         Label {
            text: i18n.tr("Author: Emanuele Sorce")
            horizontalAlignment: Text.Center
            width: parent.width
         }

         Label {
            text: i18n.tr("Contributor: Josip Delic")
            horizontalAlignment: Text.Center
            width: parent.width
         }

         Label {
            text: i18n.tr("Source code available on <a href='https://github.com/TronFortyTwo/OnTheRoad'>GitHub</a>")
            onLinkActivated: Qt.openUrlExternally(link)
            horizontalAlignment: Text.Center
            width: parent.width
         }

         Label {
            text: i18n.tr("This software is licensed under the GNU GPLv3 license as published by the Free Software Foundation.<br>Copyright 2017-2018 Emanuele Sorce<br><br>There are many ways to help this app to improve and get more useful: your feedback is much appreciated, bug listing and feature requests are very important and if you like this app, consider doing a small donation to incourage and help me.<br>Contact me: (Emanuele Sorce)<br>e-mail: emanuele.sorce@hotmail.com<br>Telegram: @TronFortyTwo")
            horizontalAlignment: Text.Center
	    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            width: parent.width
         }
      }
   }
}
