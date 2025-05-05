import QtQuick
import QtQuick.Controls 2.15

Item {
   id: root
   // Properties passed from StudentMenu
   property StackView stackView
   property int studentId
    width: 1920
    height: 1080

    Image {
        id: image
        anchors.fill: parent
        source: "realimages/student information management system (25).png"
        fillMode: Image.PreserveAspectFit
    }

    Column {
        id: formColumn
        width: 500
        anchors.verticalCenterOffset: -56
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        spacing: 25
        topPadding: 50

        // Student ID Field
        Column {
            width: parent.width
            spacing: 8

            Label {
                text: "Student ID:"
                font.family: "Courier"
                font {
                    pixelSize: 18
                    bold: true
                }
                color: "#060606"
            }

            TextField {
                id: studentIdField
                width: parent.width
                height: 45
                placeholderText: "Enter student ID"
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
                    radius: 5
                }
                validator: IntValidator { bottom: 1 }
            }
        }

        // Course Name Field
        Column {
            width: parent.width
            spacing: 8

            Label {
                text: "Course Name:"
                font {
                    pixelSize: 18
                    bold: true
                }
                color: "white"
            }

            TextField {
                id: courseField
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

        // Percentage Field
        Column {
            width: parent.width
            spacing: 8

            Label {
                text: "Progress Percentage:"
                font {
                    pixelSize: 18
                    bold: true
                }
                color: "white"
            }

            TextField {
                id: percentageField
                width: parent.width
                height: 45
                placeholderText: "0-100%"
                font.pixelSize: 16
                inputMethodHints: Qt.ImhDigitsOnly
                validator: IntValidator { bottom: 0; top: 100 }
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
        y: 692
        anchors.horizontalCenterOffset: 0
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 328
        }
        spacing: 40

        Button {
            id: addButton
            text: "Add Progress"
            width: 200
            height: 60
            font.pixelSize: 18

            background: Rectangle {
                color: "#4CAF50" // Green
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
                if (studentIdField.text && courseField.text && percentageField.text) {
                    var sid = parseInt(studentIdField.text);
                    var pct = parseFloat(percentageField.text);
                    var success = backend.addProgress(sid, courseField.text, pct);
                    if (success) {
                        console.log("Progress added successfully");
                        stackView.pop();
                    } else {
                        console.error("Failed to add progress");
                    }
                } else {
                    console.error("Please fill all fields");
                }
            }
        }

        Button {
            id: backButton
            text: "Back"
            width: 200
            height: 60
            font.pixelSize: 18

            background: Rectangle {
                color: "#f44336" // Red
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
                stackView.pop() // If using StackView
            }
        }
    }
}
