import QtQuick
import QtQuick.Controls 2.15

Item {
   id: root
   property StackView stackView
   width: 1920
   height: 1080

   Image {
       id: image
       anchors.fill: parent
       source: "realimages/student information management system (29).png"
       fillMode: Image.PreserveAspectFit
   }

   Column {
       id: formColumn
       width: 500
       anchors.centerIn: parent
       spacing: 25
       topPadding: 50

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
               color: "white"
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

       // Classes Attended Field
       Column {
           width: parent.width
           spacing: 8

           Label {
               text: "Classes Attended:"
               font {
                   pixelSize: 18
                   bold: true
               }
               color: "white"
           }

           TextField {
               id: attendedField
               width: parent.width
               height: 45
               placeholderText: "Enter number of classes attended"
               font.pixelSize: 16
               inputMethodHints: Qt.ImhDigitsOnly
               validator: IntValidator { bottom: 0 }
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
       anchors {
           bottom: parent.bottom
           horizontalCenter: parent.horizontalCenter
           bottomMargin: 100
       }
       spacing: 40

       Button {
           id: addButton
           text: "Add Attendance"
           width: 200
           height: 60
           font.pixelSize: 18

           background: Rectangle {
               color: "#2196F3" // Blue
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
               if (studentIdField.text && courseField.text && attendedField.text) {
                   // Call backend to add attendance
                   var success = backend.addAttendance(
                       parseInt(studentIdField.text),
                       courseField.text,
                       parseInt(attendedField.text)
                   )
                   if (success) {
                       console.log("Attendance added successfully")
                       stackView.pop()
                   } else {
                       console.error("Failed to add attendance")
                   }
               } else {
                   console.error("Please fill all fields")
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
