import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtCharts

Item {
    id: root
    // Passed from StudentMenu
    property StackView stackView
    property int studentId
    width: 1920
    height: 1080
    // Dynamic progress data list
    property var progressList: backend.getProgress(studentId)
    property real avgPct: {
        var sum = 0;
        for (var i = 0; i < progressList.length; ++i) sum += progressList[i].percentage;
        return progressList.length ? sum / progressList.length : 0;
    }

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "realimages/student information management system (44).png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: progressContainer
        width: 996
        height: 572
        anchors.centerIn: parent
        color: "#f0f0f0"
        radius: 10
        anchors.verticalCenterOffset: 195
        anchors.horizontalCenterOffset: 0
        opacity: 0.92

        // Header

        // Overall Progress Summary
        Rectangle {
            id: summaryCard
            width: parent.width - 60
            height: 120
            anchors {
                horizontalCenter: parent.horizontalCenter
                topMargin: 20
            }
            radius: 8
            color: "white"
            border.color: "#e0e0e0"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 30

                    // Average Progress Indicator
                Column {
                    Layout.preferredWidth: 200
                    spacing: 5

                    Label {
                        text: "Average Progress"
                        font {
                            pixelSize: 16
                            bold: true
                        }
                        color: "#616161"
                    }

                    Label {
                        text: avgPct.toFixed(1) + "%"
                        font {
                            pixelSize: 28
                            bold: true
                        }
                        color: "#2196F3"
                    }
                }

                // Progress Chart
                ChartView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    antialiasing: true
                    legend.visible: false
                    backgroundColor: "transparent"

                    PieSeries {
                        id: pieSeries
                        size: 0.9
                        holeSize: 0.7

                        PieSlice {
                            label: "Completed"
                            value: avgPct
                            color: "#4CAF50"
                            borderWidth: 0
                        }
                        PieSlice {
                            label: "Remaining"
                            value: 100 - avgPct
                            color: "#FFC107"
                            borderWidth: 0
                        }
                    }
                }

                // Overall Completion Rate
                Column {
                    Layout.preferredWidth: 200
                    spacing: 5

                    Label {
                        text: "Overall Completion"
                        font {
                            pixelSize: 16
                            bold: true
                        }
                        color: "#616161"
                    }

                    Label {
                        text: avgPct.toFixed(1) + "%"
                        font {
                            pixelSize: 28
                            bold: true
                        }
                        color: "#4CAF50"
                    }
                }
            }
        }

        // Course Progress List
        ListView {
            id: progressListView
            width: parent.width - 60
            height: parent.height - 250
            anchors {
                top: summaryCard.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 20
            }
            clip: true
            spacing: 10

            // Dynamic progress data
            model: backend.getProgress(studentId)

            delegate: Rectangle {
                width: progressListView.width
                height: 50
                radius: 5
                color: index % 2 ? "#f8f8f8" : "white"
                border.color: "#e0e0e0"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 20

                    Label {
                        text: modelData.courseName
                        font.pixelSize: 16
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                    }
                    Label {
                        text: modelData.percentage + "%"
                        font.pixelSize: 16
                        Layout.preferredWidth: 100
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }
        }

        // Back Button
        Button {
            id: backButton
            text: "Back to Menu"
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 20
            }
            width: 200
            height: 50
            font.pixelSize: 18

            background: Rectangle {
                color: "#2196F3"
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
