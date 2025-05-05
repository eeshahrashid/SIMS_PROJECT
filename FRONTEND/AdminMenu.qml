import QtQuick
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1920
    height: 1080

    // Required properties
    property StackView stackView

    Image {
        id: backgroundImage
        x: 0
        y: 0
        width: 1920
        height: 1080
        source: "realimages/student information management system (33).png"
        fillMode: Image.PreserveAspectFit

        // Logout Button (Added)
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

        // Converted all Images to Buttons with navigation:

        // Add Student Button
        Button {
            x: -43
            y: 227
            width: 426
            height: 260
            background: Image {
                source: "realimages/addstudent.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("AddStudent.qml", { stackView: stackView })
        }

        // Add Attendance Button
        Button {
            x: 126
            y: 523
            width: 360
            height: 265
            background: Image {
                source: "realimages/addattendance.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("AddAttendance.qml", { stackView: stackView })
        }

        // View All Students Button
        Button {
            x: 633
            y: 682
            width: 654
            height: 326
            background: Image {
                source: "realimages/viewall.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("ViewStudents.qml", { stackView: stackView })
        }

        // Update Student Button
        Button {
            x: 452
            y: 767
            width: 279
            height: 281
            background: Image {
                source: "realimages/updatestudent.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("UpdateStudent.qml", { stackView: stackView })
        }

        // Add Courses Button
        Button {
            x: 1595
            y: 227
            width: 352
            height: 286
            background: Image {
                source: "realimages/addcourses.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("AddCourses.qml", { stackView: stackView })
        }

        // Add Progress Button
        Button {
            x: 1425
            y: 523
            width: 311
            height: 293
            background: Image {
                source: "realimages/addprogress.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("AddProgress.qml", { stackView: stackView })
        }

        // Delete Student Button
        Button {
            x: 1187
            y: 767
            width: 273
            height: 259
            background: Image {
                source: "realimages/deletestudent.jpg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: stackView.push("DeleteStudent.qml", { stackView: stackView })
        }
    }
}
