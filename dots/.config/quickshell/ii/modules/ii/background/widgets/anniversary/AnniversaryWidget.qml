import QtQuick
import QtQuick.Layouts
import qs
import qs.services
import qs.modules.common
import qs.modules.common.functions
import qs.modules.common.widgets
import qs.modules.common.widgets.widgetCanvas
import qs.modules.ii.background.widgets

AbstractBackgroundWidget {
    id: root

    configEntryName: "anniversary"

    implicitHeight: backgroundShape.implicitHeight
    implicitWidth: backgroundShape.implicitWidth

    readonly property string startDateString: Config.options.background.widgets.anniversary.startDate
    readonly property date startDate: new Date(startDateString)

    // Ticks periodically just to force daysTogether to re-evaluate (Date() isn't reactive on its own)
    property bool refreshTick: false
    Timer {
        interval: 60 * 1000
        running: true
        repeat: true
        onTriggered: root.refreshTick = !root.refreshTick
    }

    readonly property int daysTogether: {
        root.refreshTick; // dependency to force re-evaluation over time
        const now = new Date();
        const startMidnight = new Date(root.startDate.getFullYear(), root.startDate.getMonth(), root.startDate.getDate());
        const nowMidnight = new Date(now.getFullYear(), now.getMonth(), now.getDate());
        return Math.round((nowMidnight - startMidnight) / 86400000);
    }

    StyledDropShadow {
        target: backgroundShape
    }

    MaterialShape {
        id: backgroundShape
        anchors.fill: parent
        shape: MaterialShape.Shape.Flower
        color: Appearance.colors.colPrimaryContainer
        implicitSize: 200

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 2

            MaterialSymbol {
                Layout.alignment: Qt.AlignHCenter
                iconSize: 40
                fill: 1
                color: Appearance.colors.colSecondary
                text: "favorite"
            }

            StyledText {
                Layout.alignment: Qt.AlignHCenter
                text: `${root.daysTogether}`
                color: Appearance.colors.colOnTertiaryContainer
                font {
                    family: Appearance.font.family.expressive
                    pixelSize: 44
                    weight: Font.Medium
                }
            }

            StyledText {
                Layout.alignment: Qt.AlignHCenter
                text: Config.options.background.widgets.anniversary.label
                color: Appearance.colors.colOnTertiaryContainer
                font {
                    pixelSize: 14
                }
            }
        }
    }
}
