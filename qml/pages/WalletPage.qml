import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "../controls"

Page {
    id: root
    leftPadding: 125
    rightPadding: 138
    topPadding: 69

    signal backupMnemonicClicked
    signal sendClicked
    signal receiveClicked
    signal exchangeClicked
    signal mineRewardClicked

    background: Rectangle {
        color: "#F7F7F9"
    }

    Image {
        id: walletImage
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 200
        source: "../icons/walletbackground.svg"

        Text {
            id: totalText
            text: qsTr("Total assets")
            anchors.top: parent.top
            anchors.topMargin: 42
            anchors.left: parent.left
            anchors.leftMargin: 29
            color: "#9A91BE"
            font.pointSize: 12
        }
        Image {
            id: eyesImage
            anchors.left: totalText.right
            anchors.leftMargin: 8
            anchors.verticalCenter: totalText.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: appSettings.eyeIsOpen ? "../icons/eyes_open.svg" : "../icons/eyes_close.svg"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appSettings.eyeIsOpen = !appSettings.eyeIsOpen
                }
            }
        }

        Text {
            id: amountText
            anchors.top: totalText.bottom
            anchors.topMargin: 20
            anchors.left: totalText.left
            text: appSettings.eyeIsOpen ? qsTr("$ ") + (server.value_total).toFixed(2) : "******"
            font.pointSize: 20
            color: "#FFFFFF"
        }

        // Send
        MyButton2 {
            icon.source: "../icons/send.svg"
            text: qsTr("Transfer")
            anchors.right: receiveBtn.left
            anchors.rightMargin: 30
            anchors.verticalCenter: amountText.verticalCenter
            width: 114
            visible: appSettings.walletIsCreate
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    sendClicked()
                }
            }
        }
        // Receive
        MyButton2 {
            id: receiveBtn
            icon.source: "../icons/receive.svg"
            text: qsTr("Receiving Payments")
            anchors.right: exchangeBtn.left
            anchors.rightMargin: 30
            anchors.verticalCenter: amountText.verticalCenter
            width: 114
            visible: appSettings.walletIsCreate
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    receiveClicked()
                }
            }
        }
        // Mapping
        MyButton2 {
            id: exchangeBtn
            icon.source: "../icons/mapping.svg"
            text: qsTr("Mapping")
            anchors.right: parent.right
            anchors.rightMargin: 60
            anchors.verticalCenter: amountText.verticalCenter
            width: 114
            visible: appSettings.walletIsCreate
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    exchangeClicked()
                }
            }
        }
    }

    Rectangle {
        id: whiteRec
        anchors.top: walletImage.bottom
        anchors.topMargin: -65
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        border.color: "lightsteelblue"
        border.width: 1
        radius: 20

        Text {
            id: tokenText
            anchors.top: parent.top
            anchors.topMargin: 34
            anchors.left: whiteRec.left
            anchors.leftMargin: 29
            text: qsTr("Assets")
            color: "#7D71AA"
        }

        Image {
            id: mineRewardImage
            anchors.verticalCenter: tokenText.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 35
            width: 200
            source: "../icons/mineReward.png"
            //fillMode: Image.PreserveAspectFit
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 32
                color: "#FFFFFF"
                font.pointSize: 16
                text: qsTr("Mining benefits")
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mineRewardClicked()
                }
            }
        }

        ImageButton {
            id: addImage
            visible: appSettings.walletIsCreate
            anchors.verticalCenter: tokenText.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 32
            source: "../icons/add.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    addCoinPage.open()
                }
            }
        }

        Image {
            id: noImage
            anchors.centerIn: parent
            width: 100
            fillMode: Image.PreserveAspectFit
            source: "../icons/nowallet.svg"
            visible: !appSettings.walletIsCreate
        }
        Text {
            anchors.top: noImage.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: noImage.horizontalCenter
            text: qsTr("No assets")
            color: "#E0E0E0"
            visible: !appSettings.walletIsCreate
        }

        // Token list
        ListView {
            id: walletListView
            anchors.top: tokenText.bottom
            anchors.topMargin: 22
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            model: server.model_tokens
            visible: appSettings.walletIsCreate
            spacing: 12
            clip: true
            ScrollIndicator.vertical: ScrollIndicator { }
            delegate: Rectangle {
                width: walletListView.width
                height: appWindow.currencies_show.includes(show_name) ? 60 : -12
                color: "#EBEBF1"
                radius: 14
                visible: appWindow.currencies_show.includes(show_name)
                MyImage {
                    id: itemImage
                    source: show_icon
                    radius: 14
                    width: 41
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: show_name
                    anchors.left: itemImage.right
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#333333"
                    font.pointSize: 16
                }
                Column {
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: amountText
                        text: appSettings.eyeIsOpen ? server.format_balance(chain, balance) : "******"
                        color: "#333333"
                        font.pointSize: 16
                        anchors.right: parent.right
                    }
                    Text {
                        text: appSettings.eyeIsOpen ? "≈$" + (server.get_rate(chain, show_name) * server.format_balance(chain, balance)).toFixed(2) : "******"
                        color: "#ADADAD"
                        font.pointSize: 12
                        anchors.right: amountText.right
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        server.token_requested_wallet = {
                            'chain': chain,
                            'name': name,
                            'show_icon': show_icon,
                            'show_name': show_name,
                            'balance': balance
                        }
                        var addr = ""
                        if (chain == 'violas') {
                            addr = server.address_violas
                        } else if (chain == 'diem') {
                            addr = server.address_libra
                        } else {
                            addr = ""
                        }
                        var offset = 0
                        var limit = 20
                        var params = { "addr": addr , "currency": name , "offset": offset, "limit": limit}
                        server.get_history_violas(params)
                        coinDetailPage.open()
                    }
                }
            }
        }
    }

    // Security Tip
    Rectangle {
        anchors.left: walletImage.left
        anchors.leftMargin: 1
        anchors.right: walletImage.right
        anchors.rightMargin: 1
        anchors.bottom: parent.bottom
        height: 254
        visible: appSettings.walletIsCreate && !appSettings.mnemonicIsBackup
        Image {
            id: backgroundImage
            source: "../icons/warning_background.svg"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 53
            Row {
                spacing: 5
                anchors.centerIn: parent
                Image {
                    id: warningIcon
                    source: "../icons/warning_icon.svg"
                    height: 34
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    text: qsTr("Safety Tips")
                    font.pointSize: 20
                    color: "#FFFFFF"
                    anchors.verticalCenter: warningIcon.verticalCenter
                }
            }
        }
        Row {
            id: tipRow1
            anchors.left: parent.left
            anchors.leftMargin: 120
            anchors.right: parent.right
            anchors.top: backgroundImage.bottom
            anchors.topMargin: 28
            Rectangle {
                id: row1Rec
                color: "#3D3949"   
                width: 4
                height: 4
                radius: 2
            }
            spacing: 5
            Text {
                id: tipText1
                text: qsTr("Your identity mnemonic is not backed up, please be sure to back up the mnemonic")
                font.pointSize: 14
                color: "#3D3949"
                width: tipRow1.width - spacing - row1Rec.width - 8
                elide: Text.ElideRight
                anchors.verticalCenter: row1Rec.verticalCenter
            }
        }
        Row {
            id: tipRow2
            anchors.left: parent.left
            anchors.leftMargin: 120
            anchors.right: parent.right
            anchors.top: tipRow1.bottom
            anchors.topMargin: 5
            width: parent.width
            Rectangle {
                id: row2Rec
                color: "#3D3949"   
                width: 4
                height: 4
                radius: 2
                anchors.verticalCenter: tipText2.verticalCenter
            }
            spacing: 5
            Text {
                id: tipText2
                text: qsTr("Mnemonics can be used to restore wallet assets under the same identity to prevent asset losses caused by forgetting passwords, deleting apps, losing phones, etc.")
                font.pointSize: 14
                color: "#3D3949"
                width: tipRow2.width - spacing - row2Rec.width - 8
                elide: Text.ElideRight
                anchors.verticalCenter: row2Rec.verticalCenter
            }
        }
        
        // Backup button
        MyButton3 {
            id: backupBtn
            anchors.top: tipRow2.bottom
            anchors.topMargin: 46
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Back up now")
            width: 200
            height: 40
            onClicked: {
                root.backupMnemonicClicked()
            }
        }
    }
}
