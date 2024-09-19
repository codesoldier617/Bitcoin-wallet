import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "../controls"

Page {
    id: root

    signal backArrowClicked

    ImageButton {
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: 32
        source: "../icons/backarrow2.svg"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                backArrowClicked()
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.bottom: parent.bottom
        color: "#501BA2"

        Flickable {
            width: parent.width
            height: parent.height
            ScrollIndicator.vertical: ScrollIndicator { }
            contentWidth: width
            contentHeight: contentColumn.height
            Column {
                id: contentColumn
                anchors.left: parent.left
                anchors.leftMargin: 42
                anchors.right: parent.right
                anchors.rightMargin: 42
                anchors.top: parent.top
                anchors.topMargin: 60
                anchors.bottom: parent.bottom
                spacing: 12
                Image {
                    source: "../icons/mine_background.svg"
                    width: parent.width
                    height: 250
                    Text {
                        id: totalText
                        text: qsTr("Total revenue:  0VLS")
                        anchors.top: parent.top
                        anchors.topMargin: 44
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        color: "#FFFFFF"
                        font.pointSize: 14
                    }
                    Image {
                        id: ruleImage
                        anchors.verticalCenter: totalText.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        source: "../icons/rule_rec.svg"
                        Row {
                            spacing: 5
                            anchors.centerIn: parent
                            Text {
                                text: qsTr("Rules")
                                color: "#FFFFFF"
                            }
                            Image {
                                source: "../icons/mine_arrow.svg"
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("aaaaaaaaa")
                            }
                        }
                    }

                    Image {
                        id: detailImage
                        anchors.left: totalText.left
                        anchors.top: totalText.bottom
                        anchors.topMargin: 24
                        source: "../icons/rule_rec.svg"
                        Row {
                            spacing: 5
                            anchors.centerIn: parent
                            Text {
                                text: qsTr("Mining Details")
                                color: "#FFFFFF"
                            }
                            Image {
                                source: "../icons/mine_arrow.svg"
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("aaaaaaaaa")
                            }
                        }
                    }

                    Image {
                        id: picImage
                        anchors.top: ruleImage.bottom
                        anchors.right: ruleImage.right
                        source: "../icons/mine_pic.png"
                    }

                    Text {
                        id: poolText
                        anchors.left: totalText.left
                        anchors.top: detailImage.bottom
                        anchors.topMargin: 50
                        text: qsTr("Fund pool mining has been extracted：0VLS")
                        color: "#FFFFFF"
                    }

                    Text {
                        id: poolWaitText
                        anchors.left: totalText.left
                        anchors.top: poolText.bottom
                        anchors.topMargin: 16
                        text: qsTr("To be extracted(VLS): 0")
                        color: "#FFFFFF"
                    }

                    Image {
                        source: "../icons/mine_wait.svg"
                        anchors.left: poolWaitText.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: poolWaitText.verticalCenter
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("One-click extraction")
                        }
                    }

                    
                    Text {
                        id: bankText
                        anchors.verticalCenter: poolText.verticalCenter
                        anchors.left: bankWaitText.left
                        text: qsTr("Digital Bank Mining has extracted: 0VLS")
                        color: "#FFFFFF"
                    }

                    Text {
                        id: bankWaitText
                        anchors.verticalCenter: poolWaitText.verticalCenter
                        anchors.right: bankWaitImage.left
                        anchors.rightMargin: 20
                        text: qsTr("To be extracted(VLS): 0")
                        color: "#FFFFFF"
                    }

                    Image {
                        id: bankWaitImage
                        source: "../icons/mine_wait.svg"
                        anchors.right: picImage.left
                        anchors.rightMargin: 10
                        anchors.verticalCenter: poolWaitText.verticalCenter
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("One-click extraction")
                        }
                    }
                    
                }

                Rectangle {
                    width: parent.width
                    height: 200
                    color: "#FFFFFF"
                    Text {
                        id: moreText
                        anchors.top: parent.top
                        anchors.topMargin: 22
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        text: qsTr("Get more VLS")
                    }
                    Rectangle {
                        id: hLine
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        anchors.top: moreText.bottom
                        anchors.topMargin: 10
                        height: 1
                        color: "#DEDEDE"
                    }
                    Rectangle {
                        id: vLine
                        anchors.top: hLine.bottom
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 1
                        color: "#DEDEDE"
                    }

                    Text {
                        id: newUserText
                        anchors.left: hLine.left
                        anchors.top: hLine.bottom
                        anchors.topMargin: 20
                        text: qsTr("New User Verification") 
                    }
                    Rectangle {
                        anchors.verticalCenter: newUserText.verticalCenter
                        anchors.right: vLine.left
                        anchors.rightMargin: 50
                        color: "#7038FD"
                        width: 100
                        height: 30
                        radius: 15
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("Go to verify")
                            color: "#FFFFFF"
                        }
                    }

                    Text {
                        id: depositText
                        anchors.left: hLine.left
                        anchors.top: newUserText.bottom
                        anchors.topMargin: 30
                        text: qsTr("Deposit Mining") 
                    }
                    Rectangle {
                        anchors.verticalCenter: depositText.verticalCenter
                        anchors.right: vLine.left
                        anchors.rightMargin: 50
                        color: "#7038FD"
                        width: 100
                        height: 30
                        radius: 15
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("Go to verify")
                            color: "#FFFFFF"
                        }
                    }

                    Text {
                        id: poolText2
                        anchors.left: hLine.left
                        anchors.top: depositText.bottom
                        anchors.topMargin: 30
                        text: qsTr("Fund pool mining") 
                    }
                    Rectangle {
                        anchors.verticalCenter: poolText2.verticalCenter
                        anchors.right: vLine.left
                        anchors.rightMargin: 50
                        color: "#7038FD"
                        width: 100
                        height: 30
                        radius: 15
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("Go to verify")
                            color: "#FFFFFF"
                        }
                    }

                    Text {
                        id: inviteText
                        anchors.left: vLine.right
                        anchors.leftMargin: 50
                        anchors.verticalCenter: newUserText.verticalCenter
                        text: qsTr("Invite friends") 
                    }
                    Rectangle {
                        anchors.verticalCenter: newUserText.verticalCenter
                        anchors.right: hLine.right
                        anchors.rightMargin: 50
                        color: "#7038FD"
                        width: 100
                        height: 30
                        radius: 15
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("Go to verify")
                            color: "#FFFFFF"
                        }
                    }
                    Text {
                        anchors.left: vLine.right
                        anchors.leftMargin: 50
                        anchors.verticalCenter: depositText.verticalCenter
                        text: qsTr("Loan Mining") 
                    }
                    Rectangle {
                        anchors.verticalCenter: depositText.verticalCenter
                        anchors.right: hLine.right
                        anchors.rightMargin: 50
                        color: "#7038FD"
                        width: 100
                        height: 30
                        radius: 15
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("Go to verify")
                            color: "#FFFFFF"
                        }
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 300
                    color: "#FFFFFF"
                    Text {
                        id: chartText
                        anchors.top: parent.top
                        anchors.topMargin: 22
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        text: qsTr("Rankings")
                    }
                    Row {
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        anchors.verticalCenter: chartText.verticalCenter
                        spacing: 5
                        Text {
                            text: qsTr("See more")
                        }
                        Image {
                            source: "../icons/mine_right_arrow.svg"
                        }
                    }
                    Rectangle {
                        id: hLine2
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        anchors.top: chartText.bottom
                        anchors.topMargin: 10
                        height: 1
                        color: "#DEDEDE"
                    }
                }
            }
        }
    }
}
