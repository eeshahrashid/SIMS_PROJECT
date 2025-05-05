import QtQuick
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
        source: "realimages/student information management system (47).png"
        fillMode: Image.PreserveAspectFit

        // Admin Button (Left Side)
        Button {
            id: adminButton
            x: 388
            y: 281
            width: 473
            height: 448
            background: Image {
                source: "realimages/admin.jpg"
                fillMode: Image.PreserveAspectFit
            }


            onClicked: {
                console.log("Navigating to Admin Login")
                stackView.push("AdminLogin.qml", {
                    stackView: stackView
                })
            }
        }

        // Student Button (Right Side)
        Button {
            id: studentButton
            x: 1090
            y: 264
            width: 361
            height: 465
            background: Image {
                source: "realimages/student.jpg"
                fillMode: Image.PreserveAspectFit
            }


            onClicked: {
                console.log("Navigating to Student Login")
                stackView.push("StudentLogin.qml", {
                    stackView: stackView
                })
            }
        }

        // Title Label

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

            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: parent.font
            }

            onClicked: stackView.pop()
        }
    }
}
