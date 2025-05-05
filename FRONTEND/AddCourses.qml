import QtQuick
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080

    // Required property for navigation
    property StackView stackView

    Image {
        id: image
        anchors.fill: parent
        source: "realimages/student information management system (24).png"
        fillMode: Image.PreserveAspectFit
    }

    Column {
        id: formColumn
        width: 727
        height: 485
        anchors.verticalCenterOffset: 154
        anchors.horizontalCenterOffset: -1
        anchors.centerIn: parent
        spacing: 25
        topPadding: 40

        // Student ID Field
        Column {
            width: parent.width
            spacing: 5

            Label {
                text: "Student ID:"
                font.pixelSize: 27
                font.bold: true
                font.family: "Courier"
                color: "#060606"
            }

            TextField {
                id: studentIdField
                width: parent.width
                height: 45
                placeholderText: "Enter student ID"
                font.pixelSize: 16
                inputMethodHints: Qt.ImhDigitsOnly
                validator: IntValidator { bottom: 1 }
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
                    radius: 5
                }
            }
        }

        // Course Name Field
        Column {
            width: parent.width
            spacing: 5

            Label {
                text: "Course Name:"
                font.pixelSize: 27
                font.family: "Courier"
                font.bold: true
                color: "#060606"
            }

            TextField {
                id: courseNameField
                width: parent.width
                height: 45
                placeholderText: "Enter course name"
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
                    radius: 5
                }
            }
        }
    }

    Row {
        id: buttonRow
        y: 769
        width: 394
        height: 95
        anchors.horizontalCenterOffset: -1
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 216
        }
        spacing: 30

        Button {
            id: addButton
            text: "Add Course"
            width: 180
            height: 55
            font.pixelSize: 18

            background: Rectangle {
                color: "#2196F3"
                radius: 5
                opacity: 0.9
            }

            contentItem: Text {
                text: addButton.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: addButton.font
            }

            onClicked: {
                if (studentIdField.text && courseNameField.text) {
                    // Call backend to add the course
                    var success = backend.addCourses(parseInt(studentIdField.text), [courseNameField.text]);
                    statusMessage.opacity = 1
                    if (success) {
                        statusMessage.color = "#4CAF50"
                        statusMessageText.text = "Course added successfully!"
                    } else {
                        statusMessage.color = "#f44336"
                        statusMessageText.text = "Failed to add course"
                    }
                    hideMessageTimer.start()
                } else {
                    statusMessage.opacity = 1
                    statusMessage.color = "#f44336"
                    statusMessageText.text = "Please fill all fields"
                    hideMessageTimer.start()
                }
            }
        }

        Button {
            id: backButton
            text: "Back"
            width: 180
            height: 55
            font.pixelSize: 18

            background: Rectangle {
                color: "#f44336"
                radius: 5
                opacity: 0.9
            }

            contentItem: Text {
                text: backButton.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: backButton.font
            }

            onClicked: {
                if (stackView) {
                    stackView.pop()
                } else {
                    console.error("StackView reference not set!")
                }
            }
        }
    }

    // Status message
    Rectangle {
        id: statusMessage
        width: 300
        height: 60
        anchors {
            bottom: buttonRow.top
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 20
        }
        color: "#4CAF50"
        radius: 5
        opacity: 0
        visible: opacity > 0

        Label {
            id: statusMessageText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 16
        }

        Behavior on opacity {
            NumberAnimation { duration: 300 }
        }
    }

    Timer {
        id: hideMessageTimer
        interval: 2000
        onTriggered: statusMessage.opacity = 0
    }
}
