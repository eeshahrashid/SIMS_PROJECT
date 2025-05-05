import QtQuick
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080
    // Passed from AdminMenu
    property StackView stackView

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (13).png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: deleteContainer
        width: 500
        height: 300
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        opacity: 0.92

        Column {
            id: deleteColumn
            width: 400
            anchors.centerIn: parent
            spacing: 30

            Label {
                text: "Delete Student Record"
                font {
                    pixelSize: 24
                    bold: true
                    family: "Courier"
                }
                anchors.horizontalCenter: parent.horizontalCenter
                bottomPadding: 10
                color: "#d32f2f" // Dark red for warning
            }

            // Student ID Field
            Column {
                width: parent.width
                spacing: 8

                Label {
                    text: "Student ID:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextField {
                    id: studentIdField
                    width: parent.width
                    height: 45
                    placeholderText: "Enter student ID to delete"
                    font.pixelSize: 16
                    validator: IntValidator { bottom: 1 }
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }

            // Warning Message
            Label {
                width: parent.width
                text: "Warning: This action cannot be undone!"
                color: "#d32f2f"
                font {
                    pixelSize: 16
                    bold: true
                }
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
            }
        }
        
        Row {
            id: buttonRow
            y: 264
            anchors.horizontalCenterOffset: 5
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: -14
            }
            spacing: 30

            Button {
                id: deleteButton
                text: "Delete Student"
                width: 180
                height: 50
                font.pixelSize: 18

                background: Rectangle {
                    color: "#d32f2f" // Red for delete action
                    radius: 5
                }

                contentItem: Text {
                    text: deleteButton.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font: deleteButton.font
                }

                onClicked: {
                    if (studentIdField.text) {
                        var id = parseInt(studentIdField.text);
                        var success = backend.deleteStudent(id);
                        if (success) {
                            console.log("Student deleted successfully:", id);
                            stackView.pop();
                        } else {
                            console.error("Failed to delete student:", id);
                        }
                    } else {
                        console.error("Please enter a valid Student ID to delete.");
                    }
                }
            }

            Button {
                id: backButton
                text: "Cancel"
                width: 180
                height: 50
                font.pixelSize: 18

                background: Rectangle {
                    color: "#757575" // Gray for cancel
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
}
