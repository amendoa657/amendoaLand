import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs
import qs.services
import qs.modules.common
import qs.modules.common.functions
import qs.modules.common.widgets
import qs.modules.common.widgets.widgetCanvas
import qs.modules.ii.background.widgets

AbstractBackgroundWidget {
    id: root

    configEntryName: "calendar"

    implicitHeight: backgroundShape.implicitHeight
    implicitWidth: backgroundShape.implicitWidth

    readonly property date today: new Date()

    // força re-avaliação à meia-noite
    property bool refreshTick: false
    Timer {
        interval: 60 * 1000
        running: true
        repeat: true
        onTriggered: root.refreshTick = !root.refreshTick
    }

    StyledDropShadow {
        target: backgroundShape
    }

    Rectangle {
        id: backgroundShape
        anchors.fill: parent
        implicitWidth: 300
        implicitHeight: contentColumn.implicitHeight + 40
        radius: Appearance.rounding.large
        color: Appearance.colors.colLayer0
        border.width: 1
        border.color: Appearance.colors.colLayer0Border

        ColumnLayout {
            id: contentColumn
            anchors.centerIn: parent
            width: parent.width - 32
            spacing: 10

            StyledText {
                Layout.alignment: Qt.AlignHCenter
                text: Qt.formatDate(root.today, "MMMM yyyy")
                color: Appearance.colors.colOnLayer0
                font {
                    family: Appearance.font.family.expressive
                    pixelSize: 20
                    weight: Font.Medium
                }
            }

            DayOfWeekRow {
                Layout.fillWidth: true
                locale: Qt.locale()
                delegate: StyledText {
                    text: model.shortName
                    color: Appearance.colors.colSubtext
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 11
                }
            }

            MonthGrid {
                id: grid
                Layout.fillWidth: true
                month: root.today.getMonth()
                year: root.today.getFullYear()
                locale: Qt.locale()

                delegate: Item {
                    implicitWidth: 34
                    implicitHeight: 34

                    Rectangle {
                        anchors.centerIn: parent
                        width: 28
                        height: 28
                        radius: Appearance.rounding.full
                        visible: model.today
                        color: Appearance.colors.colPrimary
                    }

                    StyledText {
                        anchors.centerIn: parent
                        text: model.day
                        color: model.today
                            ? Appearance.m3colors.m3onPrimary
                            : (model.month === grid.month
                                ? Appearance.colors.colOnLayer0
                                : Appearance.colors.colSubtext)
                        font {
                            pixelSize: 13
                            weight: model.today ? Font.Bold : Font.Normal
                        }
                    }
                }
            }
        }
    }
}
