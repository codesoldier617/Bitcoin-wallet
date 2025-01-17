import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "../controls"

Page {
    id: root
    signal backArrowClicked
    signal sendClicked
    property double currency_balance: 0

    function getBalnace(chain, name) {
        console.log("chain: ", chain, "name: ", name)
        root.currency_balance =  server.get_currency_balance(chain, name)
    }

    ImageButton {
        anchors.top: parent.top
        anchors.topMargin: 98
        anchors.left: parent.left
        anchors.leftMargin: 92
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
        text: qsTr("Transfer")
        font.pointSize: 20
        color: "#3B3847"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 197.0 / 952 * parent.height
    }

    Column {
        id: inputColumn
        anchors.top: parent.top
        anchors.topMargin: 276.0 / 952 * parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        TextFieldAddr {
            id: addrTextField
            placeholderText: qsTr("Enter address")
            onAddrClicked: {
                addrBookPage.open()
            }
        }
        TextFieldComboBox {
            id: amountTextField
            placeholderText: qsTr("Enter amount")
            Component.onCompleted: {
                getBalnace(chain, name)
            }
            onTokenSelectedChanged: {
                getBalnace(chain, name)
            }
        }
    }

    // 余额
    Text {
        id: balanceText
        text: qsTr("Balance: ") + root.currency_balance
        anchors.left: inputColumn.left
        anchors.leftMargin: 10
        anchors.top: inputColumn.bottom
        anchors.topMargin: 5
        font.pointSize: 12
    }

    // 手续费
    Text {
        id: feeText
        text: qsTr("Handling Fees")
        font.pointSize: 10
        color: "#999999"
        anchors.left: balanceText.left
        anchors.top: balanceText.bottom
        anchors.topMargin: 20
    }
    Text {
        id: lowText
        anchors.left: feeText.left
        anchors.top: feeText.bottom
        anchors.topMargin: 10
        text: qsTr("Slow")
    }
    Text {
        id: highText
        anchors.right: control.right
        anchors.verticalCenter: lowText.verticalCenter
        text: qsTr("Quick")
    }
    Slider {
        id: control
        anchors.left: lowText.left
        anchors.right: inputColumn.right
        anchors.rightMargin: 5
        anchors.top: highText.bottom
        value: 0.2

        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 1
            width: control.availableWidth
            height: implicitHeight
            color: "#AFAFAF"

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                color: "blue"
            }
        }

        handle: Rectangle {
            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 12
            implicitHeight: 12
            radius: 6
            color: control.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
        }
    }
    Text {
        id: fee2Text
        anchors.left: control.left
        anchors.top: control.bottom
        text: qsTr("0.0002")
        font.pointSize: 10
        color: "#3C3848"
    }

    MyButton3 {
        id: sendBtn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fee2Text.bottom
        anchors.topMargin: 20
        text: qsTr("Confirm transfer")
        width: 200
        height: 40
        onClicked: {
            if (addrTextField.text.length == 0) {
                tipText.text = qsTr("Address cannot be empty")
                tipText.visible = true
                tipTimer.running = true
            } else if (amountTextField.text.length == 0) {
                tipText.text = qsTr("Amount cannot be empty")
                tipText.visible = true
                tipTimer.running = true
            } else {
                server.send_coin(addrTextField.text, amountTextField.text,  amountTextField.chain, amountTextField.name)
                backArrowClicked()
            }
        }
    }

    Text {
        id: tipText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: sendBtn.bottom
        anchors.topMargin: 3
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
