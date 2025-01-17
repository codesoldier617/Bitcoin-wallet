import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../controls"

Page {
    id: root
    signal enterClicked

    function execCommand() {
        if (appSettings.password != passwordText.text) {
            tipText.text = qsTr("Incorrect password")
            tipText.visible = true
            tipTimer.running = true
        } else {
            root.enterClicked()
            appWindow.userIsLogin = true
        }
    }

    Text {
        id: titleText
        text: qsTr("Please enter your password before entering the wallet")
        font.pointSize: 20
        color: "#3C3848"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: passwordText.top
        anchors.bottomMargin: 50
    }

    TextFieldEye {
        id: passwordText
        width: 0.65 * parent.width
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -50
        placeholderText: qsTr("8-20 characters, uppercase and lowercase letters, numbers")
        imageSource: eyeIsClose ? "../icons/eye_close.svg" : "../icons/eye_open.svg"
        onReturnKeyPressed: {
            execCommand()
        }
    }

    MyButton3 {
        id: enterBtn
        anchors.top: passwordText.bottom
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Enter")
        width: 200
        height: 40
        onClicked: {
            execCommand()
        }
    }

    Text {
        id: exitBtn
        text: qsTr("Withdraw from wallet")
        color: "#F74E4E"
        font.pointSize: 14
        anchors.top: enterBtn.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea {
            anchors.fill: parent
            onClicked: {
                appWindow.close()
            }
        }
    }

    Text {
        id: tipText
        anchors.right: passwordText.right
        anchors.top: passwordText.bottom
        anchors.topMargin: 5
        visible: false
        font.pointSize: 14
        color: "#FD6565"
    }

    Timer {
        id: tipTimer
        interval: 3000
        onTriggered: tipText.visible = false
    }
}
