import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: root  // Main component ID
    width: 1920
    height: 1080

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (46).png"
        fillMode: Image.PreserveAspectFit
    }

    // Header

    // List Container
    Rectangle {
        id: listContainer
        width: 1033
        height: 608
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        anchors.verticalCenterOffset: 178
        anchors.horizontalCenterOffset: 1
        opacity: 0.9

        // Column Headers
        Row {
            id: headersRow
            width: parent.width - 40
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 20
            }
            spacing: 20

            Label { 
                id: idHeader
                text: "ID"
                width: 150
                font { pixelSize: 18; bold: true }
            }
            Label {
                id: nameHeader
                text: "Name" 
                width: 300
                font { pixelSize: 18; bold: true }
            }
            Label {
                id: emailHeader
                text: "Email"
                width: 350
                font { pixelSize: 18; bold: true }
            }
            Label {
                id: coursesHeader
                text: "Courses"
                width: 300
                font { pixelSize: 18; bold: true }
            }
        }

        // Student List
        ListView {
            id: studentsListView
            width: parent.width - 40
            height: parent.height - 100
            anchors {
                top: headersRow.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 10
            }
            clip: true
            spacing: 5

            // Dynamic model from C++ backend
            model: backend.getAllStudents()

            delegate: Rectangle {
                id: delegateItem
                width: studentsListView.width
                height: 50
                color: index % 2 ? "#f8f8f8" : "white"
                radius: 3

                Row {
                    anchors.fill: parent
                    anchors.margins: 5
                    spacing: 20

                    Label {
                        id: idLabel
                        text: modelData.studentId
                        width: 150
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                    }
                    Label {
                        id: nameLabel
                        text: modelData.name
                        width: 300
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                    }
                    Label {
                        id: emailLabel
                        text: modelData.email
                        width: 350
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    Label {
                        id: coursesLabel
                        text: modelData.courses
                        width: 300
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
                id: scrollBar
                policy: ScrollBar.AsNeeded
            }
        }
    }

    // Back Button
    Button {
        id: backButton
        y: 951
        text: "Back to Admin Menu"
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 69
        }
        width: 250
        height: 60
        font.pixelSize: 20
        anchors.horizontalCenterOffset: 0

        background: Rectangle {
            id: buttonBackground
            color: "#f44336"
            radius: 5
            opacity: 0.9
        }

        contentItem: Text {
            id: buttonText
            text: backButton.text
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font: backButton.font
        }

        onClicked: stackView.pop()
    }
}
