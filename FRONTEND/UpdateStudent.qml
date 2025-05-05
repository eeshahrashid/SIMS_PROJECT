import QtQuick
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (39).png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: formContainer
        width: 585
        height: 733
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        anchors.verticalCenterOffset: 129
        anchors.horizontalCenterOffset: 1
        opacity: 0.92

        Column {
            id: formColumn
            width: 540
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 30
            }
            spacing: 20

            // Student ID Field (non-editable)
            Column {
                width: parent.width
                spacing: 5

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
                    text: "1001" // Pre-filled with student ID
                    font.pixelSize: 16
                    readOnly: true
                    background: Rectangle {
                        color: "#e0e0e0"
                        radius: 5
                    }
                }
            }

            // Name Field
            Column {
                width: parent.width
                spacing: 5

                Label {
                    text: "Full Name:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextField {
                    id: nameField
                    width: parent.width
                    height: 45
                    text: "John Doe" // Pre-filled with current name
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }

            // Password Field
            Column {
                width: parent.width
                spacing: 5

                Label {
                    text: "New Password:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextField {
                    id: passwordField
                    width: parent.width
                    height: 45
                    placeholderText: "Leave blank to keep current"
                    echoMode: TextInput.Password
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }

            // Email Field
            Column {
                width: parent.width
                spacing: 5

                Label {
                    text: "Email:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextField {
                    id: emailField
                    width: parent.width
                    height: 45
                    text: "john@school.edu" // Pre-filled with current email
                    font.pixelSize: 16
                    inputMethodHints: Qt.ImhEmailCharactersOnly
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }

            // Phone Field
            Column {
                width: parent.width
                spacing: 5

                Label {
                    text: "Phone Number:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextField {
                    id: phoneField
                    width: parent.width
                    height: 45
                    text: "555-123-4567" // Pre-filled with current phone
                    font.pixelSize: 16
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }

            // Gender Field
            Column {
                width: parent.width
                spacing: 5

                Label {
                    text: "Gender:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                ComboBox {
                    id: genderField
                    width: parent.width
                    height: 45
                    model: ["Male", "Female", "Other", "Prefer not to say"]
                    currentIndex: 0 // Set to current gender
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }

            // Address Field
            Column {
                width: parent.width
                spacing: 5

                Label {
                    text: "Address:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextArea {
                    id: addressField
                    width: parent.width
                    height: 100
                    text: "123 Main St, Anytown, USA" // Pre-filled with current address
                    wrapMode: Text.Wrap
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }
        }

        Row {
            id: buttonRow
            y: 700
            anchors.horizontalCenterOffset: 1
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: -22
            }
            spacing: 30

            Button {
                id: updateButton
                text: "Update Student"
                width: 200
                height: 55
                font.pixelSize: 18

                background: Rectangle {
                    color: "#4CAF50"
                    radius: 5
                }

                contentItem: Text {
                    text: updateButton.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font: updateButton.font
                }

                onClicked: {
                    console.log("Updating student:", studentIdField.text);
                    // Add your update logic here
                }
            }

            Button {
                id: backButton
                text: "Back"
                width: 200
                height: 55
                font.pixelSize: 18

                background: Rectangle {
                    color: "#f44336"
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
