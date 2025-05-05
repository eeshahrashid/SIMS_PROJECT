import QtQuick
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    // Passed from StudentMenu
    property StackView stackView
    property int studentId
    // Password valid when match and meets criteria
    property bool passwordsValid: newPasswordField.text.length >= 8 && newPasswordField.text === confirmPasswordField.text
    height: 1080

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (36).png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: passwordContainer
        width: 598
        height: 432
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        anchors.verticalCenterOffset: 150
        anchors.horizontalCenterOffset: 0
        opacity: 0.92

        Column {
            id: formColumn
            width: 400
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 40
            }
            spacing: 25

            Label {
                text: "Update Password"
                font {
                    pixelSize: 28
                    bold: true
                    family: "Courier"
                }
                anchors.horizontalCenter: parent.horizontalCenter
                bottomPadding: 10
            }

            // Current Password Field (hidden by default - uncomment if needed)
            /*
            Column {
                width: parent.width
                spacing: 5
                visible: false // Enable if current password verification is required

                Label {
                    text: "Current Password:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextField {
                    id: currentPasswordField
                    width: parent.width
                    height: 45
                    placeholderText: "Enter current password"
                    echoMode: TextInput.Password
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                }
            }
            */

            // New Password Field
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
                    id: newPasswordField
                    width: parent.width
                    height: 45
                    placeholderText: "Enter new password"
                    echoMode: TextInput.Password
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                    onTextChanged: validatePasswords()
                }
            }

            // Password Requirements
            Column {
                width: parent.width
                spacing: 2
                visible: newPasswordField.text.length > 0

                Label {
                    text: "✓ 8+ characters"
                    font.pixelSize: 14
                    color: newPasswordField.text.length >= 8 ? "#4CAF50" : "#757575"
                }
                Label {
                    text: "✓ Contains number"
                    font.pixelSize: 14
                    color: /\d/.test(newPasswordField.text) ? "#4CAF50" : "#757575"
                }
                Label {
                    text: "✓ Special character"
                    font.pixelSize: 14
                    color: /[!@#$%^&*]/.test(newPasswordField.text) ? "#4CAF50" : "#757575"
                }
            }

            // Confirm Password Field
            Column {
                width: parent.width
                spacing: 5

                Label {
                    text: "Confirm Password:"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                }

                TextField {
                    id: confirmPasswordField
                    width: parent.width
                    height: 45
                    placeholderText: "Re-enter new password"
                    echoMode: TextInput.Password
                    font.pixelSize: 16
                    background: Rectangle {
                        color: "white"
                        radius: 5
                    }
                    onTextChanged: validatePasswords()
                }
            }

            // Password Match Indicator
            Label {
                id: passwordMatchLabel
                width: parent.width
                text: {
                    if (newPasswordField.text.length === 0 || confirmPasswordField.text.length === 0) return ""
                    else if (newPasswordField.text === confirmPasswordField.text) return "✓ Passwords match"
                    else return "✗ Passwords do not match"
                }
                color: newPasswordField.text === confirmPasswordField.text ? "#4CAF50" : "#F44336"
                font.pixelSize: 14
                visible: newPasswordField.text.length > 0 && confirmPasswordField.text.length > 0
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Row {
            id: buttonRow
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 30
            }
            spacing: 30

            Button {
                id: updateButton
                text: "Update Password"
                width: 200
                height: 50
                font.pixelSize: 18
                enabled: passwordsValid

                background: Rectangle {
                    color: passwordsValid ? "#4CAF50" : "#BDBDBD"
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
                    if (passwordsValid) {
                        // Call backend to update password
                        var success = backend.updatePassword(studentId, newPasswordField.text);
                        if (success) {
                            console.log("Password updated successfully");
                            stackView.pop();
                        } else {
                            console.error("Failed to update password");
                        }
                    }
                }
            }

            Button {
                id: backButton
                text: "Cancel"
                width: 200
                height: 50
                font.pixelSize: 18

                background: Rectangle {
                    color: "#F44336"
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
