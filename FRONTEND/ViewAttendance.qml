import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: root
    width: 1920
    height: 1080

    property StackView stackView
    property int studentId
    // Properties for dynamic attendance stats
    property var attendanceList: backend.getAttendance(studentId)
    property int totalAttended: {
        var sum = 0;
        for (var i = 0; i < attendanceList.length; ++i) sum += attendanceList[i].classesAttended;
        return sum;
    }
    property int recordCount: attendanceList.length
    property real averageAttended: recordCount ? (totalAttended / recordCount) : 0
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (40).png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: attendanceContainer
        width: 1073
        height: 613
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        anchors.verticalCenterOffset: 184
        anchors.horizontalCenterOffset: -11
        opacity: 0.92

        // Header

        // Summary Statistics
        Row {
            id: statsRow
            anchors {
                horizontalCenter: parent.horizontalCenter
                topMargin: 20
            }
            spacing: 40

            Rectangle {
                width: 180
                height: 80
                radius: 8
                color: "#4CAF50"
                opacity: 0.9

                Column {
                    anchors.centerIn: parent
                    spacing: 5

                    Label {
                        text: "Attended"
                        font {
                            pixelSize: 16
                            bold: true
                        }
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Label {
                        text: totalAttended
                        font {
                            pixelSize: 22
                            bold: true
                        }
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            Rectangle {
                width: 180
                height: 80
                radius: 8
                color: "#F44336"
                opacity: 0.9

                Column {
                    anchors.centerIn: parent
                    spacing: 5

                Label {
                    text: "Records"
                        font {
                            pixelSize: 16
                            bold: true
                        }
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Label {
                        text: recordCount
                        font {
                            pixelSize: 22
                            bold: true
                        }
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            Rectangle {
                width: 180
                height: 80
                radius: 8
                color: "#2196F3"
                opacity: 0.9

                Column {
                    anchors.centerIn: parent
                    spacing: 5

                Label {
                    text: "Avg Attended"
                        font {
                            pixelSize: 16
                            bold: true
                        }
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Label {
                        text: averageAttended.toFixed(1) + "%"
                        font {
                            pixelSize: 22
                            bold: true
                        }
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }

        // Attendance Records List
        ListView {
            id: attendanceListView
            width: parent.width - 60
            height: parent.height - 220
            anchors {
                top: statsRow.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 20
            }
            clip: true
            spacing: 8

            // Dynamic attendance records
            model: backend.getAttendance(studentId)

            delegate: Rectangle {
                width: attendanceListView.width
                height: 50
                radius: 5
                color: index % 2 ? "#f8f8f8" : "white"
                border.color: "#e0e0e0"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 20

                    // Course Name
                    Label {
                        text: modelData.courseName
                        font.pixelSize: 16
                        Layout.fillWidth: true
                    }

                    // Classes Attended
                    Label {
                        text: modelData.classesAttended
                        font.pixelSize: 16
                        Layout.preferredWidth: 100
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }
        }

        // Back Button
        Button {
            id: backButton
            text: "Back to Menu"
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 20
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
