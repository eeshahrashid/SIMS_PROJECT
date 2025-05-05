import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080

    // Required property for navigation
    property StackView stackView


    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (28).png"
        fillMode: Image.PreserveAspectFit

        // Back Button
        Button {
            x: 50
            y: 50
            width: 150
            height: 60
            text: "Back"
            wheelEnabled: false
            icon.color: "#ffffff"
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
            anchors.verticalCenterOffset: 133
            anchors.horizontalCenterOffset: 0
            opacity: 0.92

            Column {
                anchors.centerIn: parent
                spacing: 30
                width: parent.width - 100

                // Title

                // Student ID Field with Hint
                TextField {
                    id: studentIdField
                    width: parent.width
                    height: 70
                    placeholderText: "Enter Student ID (try '1001')"
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    background: Rectangle {
                        color: "white"
                        radius: 5
                        border.color: studentIdField.activeFocus ? "#2196F3" : "#e0e0e0"
                        border.width: 2
                    }
                }

                // Student Password Field with Hint
                TextField {
                    id: studentPasswordField
                    width: parent.width
                    height: 70
                    placeholderText: "Enter Password (try 'student123')"
                    echoMode: TextInput.Password
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    background: Rectangle {
                        color: "white"
                        radius: 5
                        border.color: studentPasswordField.activeFocus ? "#2196F3" : "#e0e0e0"
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
        var studentId = studentIdField.text.trim()
        var password = studentPasswordField.text.trim()

        if (studentId === "" || password === "") {
            showError("Please enter both Student ID and password");
            return;
        }
        var idInt = parseInt(studentId);
        var ok = backend.loginStudent(idInt, password);
        if (ok) {
            errorMessage.visible = false;
            stackView.push("StudentMenu.qml", {
                stackView: stackView,
                studentId: idInt
            });
        } else {
            showError("Invalid Student ID or password");
        }
    }

    // Helper function to show errors
    function showError(message) {
        errorMessage.text = message
        errorMessage.visible = true
    }

    // Clear error when typing
    Connections {
        target: studentIdField
        function onTextChanged() { errorMessage.visible = false }
    }
    Connections {
        target: studentPasswordField
        function onTextChanged() { errorMessage.visible = false }
    }
}
