import QtQuick
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080

    Image {
        id: image
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        source: "realimages/student information management system (21).png"
        fillMode: Image.PreserveAspectFit
    }

    Column {
        id: formColumn
        width: 712
        height: 698
        anchors.verticalCenterOffset: 80
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        spacing: 25
        topPadding: 40

        // Name Field
        Column {
            width: parent.width
            spacing: 5

            Label {
                text: "Full Name:"
                font {
                    pixelSize: 22
                    bold: true
                    family: "Courier"
                }
                color: "#060606"
            }

            TextField {
                id: nameField
                width: parent.width
                height: 50
                placeholderText: "Enter student's full name"
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
                    radius: 5
                }
            }
        }

        // Password Field
        Column {
            width: parent.width
            spacing: 5

            Label {
                text: "Password:"
                font {
                    pixelSize: 22
                    bold: true
                    family: "Courier"
                }
                color: "#060606"
            }

            TextField {
                id: passwordField
                width: parent.width
                height: 50
                placeholderText: "Enter password"
                echoMode: TextInput.Password
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
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
                    pixelSize: 22
                    bold: true
                    family: "Courier"
                }
                color: "#060606"
            }

            TextField {
                id: emailField
                width: parent.width
                height: 50
                placeholderText: "Enter email address"
                inputMethodHints: Qt.ImhEmailCharactersOnly
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
                    radius: 5
                }
            }
        }

        // Phone Number Field
        Column {
            width: parent.width
            spacing: 5

            Label {
                text: "Phone Number:"
                font {
                    pixelSize: 22
                    bold: true
                    family: "Courier"
                }
                color: "#060606"
            }

            TextField {
                id: phoneField
                width: parent.width
                height: 50
                placeholderText: "Enter phone number"
                inputMethodHints: Qt.ImhDialableCharactersOnly
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
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
                    pixelSize: 22
                    bold: true
                    family: "Courier"
                }
                color: "#060606"
            }

            ComboBox {
                id: genderField
                width: parent.width
                height: 50
                model: ["Male", "Female", "Other"]
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    opacity: 0.85
                    radius: 5
                }
                popup.background: Rectangle {
                    color: "white"
                    opacity: 0.95
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
                    pixelSize: 22
                    bold: true
                    family: "Courier"
                }
                color: "#060606"
            }

            TextArea {
                id: addressField
                width: parent.width
                height: 100
                placeholderText: "Enter full address"
                wrapMode: Text.Wrap
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
        y: 975
        anchors.horizontalCenterOffset: 0
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 45
        }
        spacing: 40

        Button {
            id: addButton
            text: "Add Student"
            width: 220
            height: 60
            font.pixelSize: 20

            background: Rectangle {
                color: "#4CAF50"
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
                // Invoke C++ backend to add the student
                var added = backend.addStudent(
                    nameField.text,
                    passwordField.text,
                    genderField.currentText,
                    emailField.text,
                    phoneField.text,
                    addressField.text
                )
                if (added) {
                    console.log("Student added successfully")
                    stackView.pop()
                } else {
                    console.error("Failed to add student")
                }
            }
        }

        Button {
            id: backButton
            text: "Back"
            width: 220
            height: 60
            font.pixelSize: 20

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
                stackView.pop() // If using StackView
            }
        }
    }
}
