import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080

    // Required property for navigation
    property StackView stackView

    // CORRECT ADMIN CREDENTIALS (HARDCODED)
    property string validAdminId: "admin"
    property string validAdminPassword: "admin123"

    Image {
        id: backgroundImage
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        source: "realimages/student information management system (27).png"
        fillMode: Image.PreserveAspectFit

        // Back Button
        Button {
            x: 50
            y: 50
            width: 150
            height: 60
            text: "Back"
            font {
                pixelSize: 20
                bold: true
                family: "Courier"
            }
            background: Rectangle {
                color: "#f44336"
                radius: 5
            }
            onClicked: stackView.pop()
        }

        // Login Form Container
        Rectangle {
            width: 822
            height: 452
            anchors.centerIn: parent
            color: "#f0f0f0"
            radius: 10
            anchors.verticalCenterOffset: 135
            anchors.horizontalCenterOffset: 0
            opacity: 0.92

            Column {
                anchors.centerIn: parent
                spacing: 30
                width: parent.width - 100

                // Title

                // Admin ID Field with Hint
                TextField {
                    id: adminIdField
                    width: parent.width
                    height: 70
                    placeholderText: "Enter Admin ID (try 'admin')"
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    background: Rectangle {
                        color: "white"
                        radius: 5
                        border.color: adminIdField.activeFocus ? "#2196F3" : "#e0e0e0"
                        border.width: 2
                    }
                }

                // Admin Password Field with Hint
                TextField {
                    id: adminPasswordField
                    width: parent.width
                    height: 70
                    placeholderText: "Enter Password (try 'admin123')"
                    echoMode: TextInput.Password
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    background: Rectangle {
                        color: "white"
                        radius: 5
                        border.color: adminPasswordField.activeFocus ? "#2196F3" : "#e0e0e0"
                        border.width: 2
                    }
                }

                // Error Message
                Label {
                    id: errorMessage
                    width: parent.width
                    visible: false
                    color: "#f44336"
                    font {
                        pixelSize: 18
                        bold: true
                    }
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                }

                // Login Button
                Button {
                    width: parent.width
                    height: 70
                    text: "Login"
                    font {
                        pixelSize: 24
                        bold: true
                        family: "Courier"
                    }
                    background: Rectangle {
                        color: "#4CAF50"
                        radius: 5
                    }
                    onClicked: attemptLogin()
                }
            }
        }
    }

    // Login Function
    function attemptLogin() {
        var adminId = adminIdField.text.trim()
        var password = adminPasswordField.text.trim()

        if (adminId === "" || password === "") {
            showError("Please enter both Admin ID and password")
            return
        }

        if (adminId === validAdminId && password === validAdminPassword) {
            errorMessage.visible = false
            stackView.push("AdminMenu.qml", {
                stackView: stackView
            })
        } else {
            showError("Invalid credentials\nTry: ID: admin\nPassword: admin123")
        }
    }

    // Helper function to show errors
    function showError(message) {
        errorMessage.text = message
        errorMessage.visible = true
    }

    // Clear error when typing
    Connections {
        target: adminIdField
        function onTextChanged() { errorMessage.visible = false }
    }
    Connections {
        target: adminPasswordField
        function onTextChanged() { errorMessage.visible = false }
    }
}
