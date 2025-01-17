import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../controls"

Page {
    id: root
    signal backArrowClicked
    signal backupClicked
    signal laterBackupClicked

    ImageButton {
        anchors.top: parent.top
        anchors.topMargin: 24
        anchors.left: parent.left
        anchors.leftMargin: 24
        width: 32
        source: "../icons/backarrow2.svg"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                backArrowClicked()
            }
        }
    }

    Text {
        id: titleText
        text: qsTr("Get mnemonic phrase")
        font.pointSize: 20
        color: "#3B3847"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 48
    }
    Text {
        id: title2Text
        text: qsTr("Equivalent to owning wallet assets")
        font.pointSize: 16
        color: "#3B3847"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleText.bottom
        anchors.topMargin: 4
    }

    Image {
        id: mneImage
        source: "../icons/mne_image.svg"
        fillMode: Image.PreserveAspectFit
        width: 140
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: title2Text.bottom
        anchors.topMargin: 32 / 952 * parent.height
    }

    Item {
        id: textItem
        anchors.horizontalCenter: parent.horizontalCenter
        width: backupDetailText.width + 50
        height: backupText.height + backupDetailText.height + offlineStoreText.height + offlineStoreDetailText.height + 3 * 4
        anchors.top: mneImage.bottom    
        anchors.topMargin: 32 / 952 * parent.height
        
        Rectangle {
            id: backupRec
            width: 4
            height: 4
            radius: 2
            color: "#3B3847"
            anchors.left: parent.left
            anchors.top: parent.top
        }
        Text {
            id: backupText
            anchors.left: backupRec.left
            anchors.leftMargin: 8
            anchors.verticalCenter: backupRec.verticalCenter
            text: qsTr("Backup group word")
            font.pointSize: 12
            color: "#3B3847"
        }

        Text {
            id: backupDetailText
            anchors.left: backupText.left
            anchors.top: backupText.bottom
            anchors.topMargin: 8
            font.pointSize: 12
            color: "#3B3847"
            text: qsTr("Use paper and pen to copy the mnemonic correctly. If your phone is lost, stolen, or damaged, Keystore will be able to recover your assets.")
        }

        Rectangle {
            id: offlineRec
            width: 4
            height: 4
            radius: 2
            color: "#3B3847"
            anchors.left: backupRec.left
            anchors.top: backupDetailText.bottom
            anchors.topMargin: 16
        }
        Text {
            id: offlineStoreText
            anchors.left: offlineRec.left
            anchors.leftMargin: 8
            anchors.verticalCenter: offlineRec.verticalCenter
            text: qsTr("Offline storage")
            font.pointSize: 12
            color: "#3B3847"
        }

        Text {
            id: offlineStoreDetailText
            anchors.left: offlineStoreText.left
            anchors.top: offlineStoreText.bottom
            anchors.topMargin: 8
            font.pointSize: 12
            color: "#3B3847"
            text: qsTr("Please keep it in a safe place isolated from the network. Do not share or store the mnemonic in an online environment, such as email, photo album, social applications, etc.")
        }
    }

    MyButton3 {
        id: backupBtn
        anchors.top: textItem.bottom
        anchors.topMargin: 56 / 952 * parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Start backup")
        width: 200
        height: 40
        onClicked: {
            root.backupClicked()
        }
    }

    MyButton3 {
        id: laterBackupBtn
        anchors.top: backupBtn.bottom
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Back up later")
        width: 200
        height: 40
        onClicked: {
            root.laterBackupClicked()
        }
    }
}
