import QtQuick
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080

    // Required properties
    property StackView stackView
    property string studentId: ""

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (34).png"
        fillMode: Image.PreserveAspectFit

        // Logout Button
        Button {
            x: 50
            y: 50
            width: 150
            height: 60
            text: "Logout"
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

        // Welcome Message
        Label {
            x: 50
            y: 120
            text: "Welcome, Student " + (studentId || "")
            font {
                pixelSize: 28
                bold: true
                family: "Courier"
            }
            color: "white"
        }

        // View Profile Button
        Button {
            x: 766
            y: 635
            width: 389
            height: 314
            background: Image {
                source: "realimages/viewprofile.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("ViewProfile.qml", {
                stackView: stackView,
                studentId: studentId
            })
        }

        // View Courses Button
        Button {
            x: 41
            y: 326
            width: 337
            height: 289
            background: Image {
                source: "realimages/viewcourses.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("ViewCourses.qml", {
                stackView: stackView,
                studentId: studentId
            })
        }

        // View Attendance Button
        Button {
            x: 1161
            y: 621
            width: 427
            height: 299
            background: Image {
                source: "realimages/viewattendance.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("ViewAttendance.qml", {
                stackView: stackView,
                studentId: studentId
            })
        }

        // View Progress Button
        Button {
            x: 363
            y: 563
            width: 328
            height: 326
            background: Image {
                source: "realimages/viewprogress.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("ViewProgress.qml", {
                stackView: stackView,
                studentId: studentId
            })
        }

        // Update Password Button
        Button {
            x: 1507
            y: 336
            width: 382
            height: 279
            background: Image {
                source: "realimages/updatepassword.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("UpdatePassword.qml", {
                stackView: stackView,
                studentId: studentId
            })
        }
    }
}

