import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "../controls"

Control {
    padding: 40

    signal goBack

    contentItem: Item {
        Image {
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
            text: qsTr("Transaction Details")
            color: "#333333"
            font.pointSize: 16
            font.weight: Font.Medium
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: statusImage
            anchors.top: titleText.bottom
            anchors.topMargin: 88
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../icons/success_detail.svg"
            width: 38
            fillMode: Image.PreserveAspectFit
        }
        
        Text {
            id: statusText
            anchors.top: statusImage.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: server.violas_transaction_detail["sender"] == server.address_violas ? qsTr("Transfer successful") : qsTr("Received successfully")
            font.pointSize: 16
            color: "#00D1AF"
        }
        
        Column {
            anchors.top: statusImage.bottom
            anchors.topMargin: 50
            anchors.left: parent.left
            //anchors.leftMargin: 20
            Text {
                font.pointSize: 12
                color: "#999999"
                text: qsTr("Time: \t") + server.format_timestamp(server.violas_transaction_detail["confirmed_time"])
            }
            Text {
                font.pointSize: 12
                color: "#999999"
                text: qsTr("Transaction Number: \t") + server.violas_transaction_detail["version"]
            }
            Text {
                font.pointSize: 12
                color: "#999999"
                text: qsTr("Amount: \t") + server.format_balance('violas', server.violas_transaction_detail["amount"])
            }
            Text {
                font.pointSize: 12
                color: "#999999"
                text: qsTr("Payment address: \t") + server.violas_transaction_detail["receiver"]
            }
            Text {
                font.pointSize: 12
                color: "#999999"
                text: qsTr("Payment Address: \t") + server.violas_transaction_detail["sender"]
            }
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 16
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Browser query for more detailed information")
            font.pointSize: 14
            color: "#7038FD"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    server.open_url("https://testnet.violas.io/app/tBTC")
                }
            }
        }
    }
}
