import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: root
    width: 1920
    height: 1080
    property StackView stackView
    property int studentId

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (41).png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: coursesContainer
        width: 1073
        height: 582
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        anchors.verticalCenterOffset: 164
        anchors.horizontalCenterOffset: -7
        opacity: 0.92

        // Header

        // Dynamic Courses List
        ListView {
            id: coursesListView
            width: parent.width - 60
            height: parent.height - 150
            anchors {
                horizontalCenter: parent.horizontalCenter
                topMargin: 30
            }
            clip: true
            spacing: 5

            model: backend.getCourses(studentId)

            delegate: Rectangle {
                width: coursesListView.width
                height: 50
                radius: 5
                color: index % 2 ? "#f8f8f8" : "white"
                border.color: "#e0e0e0"
                border.width: 1

                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: modelData
                    font.pixelSize: 18
                    elide: Text.ElideRight
                }
            }

            ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }
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
