import QtQuick
import QtQuick.Controls 2.15
import SIMS

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    // Add a property to accept the StackView
    property StackView stackView

    color: Constants.backgroundColor

    // Timer for automatic navigation
    Timer {
        id: autoNavigateTimer
        interval: 7000 // 3 seconds
        running: true // Start automatically
        repeat: false // Only trigger once
        onTriggered: {
            console.log("Auto-navigating to SecondWindow after 7 seconds")
            if (stackView) {
                stackView.push("SecondWindow.qml", { stackView: stackView })
            } else {
                console.error("StackView is not defined!")
            }
        }
    }

    Text {
        id: label
        text: qsTr("Hello SIMS")
        font.family: Constants.font.family
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: image
        x: -9
        y: -209
        width: 1937
        height: 1508
        // Load image from QML module resources
        source: "realimages/simsposterx.jpg"
        fillMode: Image.PreserveAspectFit
    }
}
