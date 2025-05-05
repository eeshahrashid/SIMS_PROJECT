import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: root
    // Passed from StudentMenu
    property StackView stackView
    property int studentId
    // Fetch profile data
    property var studentData: backend.getStudent(studentId)
    width: 1920
    height: 1080

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (43).png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: profileContainer
        width: 493
        height: 598
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        anchors.verticalCenterOffset: 182
        anchors.horizontalCenterOffset: 1
        opacity: 0.92

        Column {
            id: profileColumn
            width: 500
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 40
            }
            spacing: 20

            // Profile Header

            // Student Photo (Placeholder)
            Rectangle {
                width: 150
                height: 150
                anchors.horizontalCenter: parent.horizontalCenter
                radius: width/2
                color: "#e0e0e0"
                border.color: "#2196F3"
                border.width: 3

                Label {
                    anchors.centerIn: parent
                    text: "Photo"
                    font.pixelSize: 16
                    color: "#757575"
                }
            }

            // Student Details Grid
            GridLayout {
                width: parent.width
                columns: 2
                columnSpacing: 20
                rowSpacing: 15

                // Student ID
                Label {
                    text: "Student ID:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    Layout.alignment: Qt.AlignRight
                }
                Label {
                    text: studentData.studentId
                    font.pixelSize: 18
                }

                // Name
                Label {
                    text: "Name:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    Layout.alignment: Qt.AlignRight
                }
                Label {
                    text: studentData.name
                    font.pixelSize: 18
                }

                // Email
                Label {
                    text: "Email:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    Layout.alignment: Qt.AlignRight
                }
                Label {
                    text: studentData.email
                    font.pixelSize: 18
                }

                // Phone
                Label {
                    text: "Phone:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    Layout.alignment: Qt.AlignRight
                }
                Label {
                    text: studentData.phoneNumber
                    font.pixelSize: 18
                }

                // Gender
                Label {
                    text: "Gender:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    Layout.alignment: Qt.AlignRight
                }
                Label {
                    text: studentData.gender
                    font.pixelSize: 18
                }

                // Address
                Label {
                    text: "Address:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    Layout.alignment: Qt.AlignRight
                }
                Label {
                    text: studentData.address
                    font.pixelSize: 18
                    wrapMode: Text.WordWrap
                    Layout.maximumWidth: 300
                }

                // Enrollment Date (if available)
                Label {
                    text: "Enrolled:"  
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    Layout.alignment: Qt.AlignRight
                }
                Label {
                    text: "" // No data available
                    font.pixelSize: 18
                }
            }
        }

        // Back Button
        Button {
            id: backButton
            text: "Back to Menu"
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 30
            }
            width: 200
            height: 50
            font.pixelSize: 18

            background: Rectangle {
                color: "#2196F3"
                radius: 5
            }

            contentItem: Text {
                text: backButton.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: backButton.font
            }

            onClicked: stackView.pop()
        }
    }
}
