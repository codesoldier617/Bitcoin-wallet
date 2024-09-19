import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../controls"

Control {
    id: root
    padding: 40

    signal goBack

    contentItem: Item {
        ImageButton {
            source: "../icons/backarrow.svg"
            anchors.left: parent.left
            anchors.verticalCenter: titleText.verticalCenter
            width: 16
            fillMode: Image.PreserveAspectFit
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    goBack()
                }
            }
        }
        Text {
            id: titleText
            text: qsTr("Add an address")
            color: "#333333"
            font.pointSize: 16
            font.weight: Font.Medium
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Column {
            id: inputColumn
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: titleText.bottom
            anchors.topMargin: 40
            spacing: 8
            Row {
                spacing: 8
                Text {
                    id: commentText
                    text: qsTr("Remark")
                    font.pointSize: 14
                    color: "#333333"
                }
                TextFieldLine {
                    id: commentTextField
                    width: 300
                    anchors.verticalCenter: commentText.verticalCenter
                    placeholderText: qsTr("Please enter a comment")
                }
            }
            Row {
                spacing: 8
                Text {
                    id: addrText
                    text: qsTr("Address")
                    font.pointSize: 14
                    color: "#333333"
                }
                TextFieldLine {
                    id: addrTextField
                    width: 300
                    anchors.verticalCenter: addrText.verticalCenter
                    placeholderText: qsTr("Please enter your address")
                }
            }
        }

        MyButton3 {
            id: addBtn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: inputColumn.bottom
            anchors.topMargin: 20
            text: qsTr("Add")
            width: 200
            height: 40
            onClicked: {
                server.model_address_book.append({ 'name': commentTextField.text, 'address': addrTextField.text })
                commentTextField.text = ""
                addrTextField.text = ""
                goBack()
            }
        }
    }
}
