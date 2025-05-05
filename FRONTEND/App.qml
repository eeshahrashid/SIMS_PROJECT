import QtQuick
import QtQuick.Controls
import SIMS

ApplicationWindow {
    visible: true
    width: 1920
    height: 1080
    title: "SIMS"

    // StackView for navigation
    StackView {
        id: stackView
        initialItem: Screen01 { stackView: stackView } // Pass StackView to Screen01
        anchors.fill: parent
    }
}
