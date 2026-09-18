import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import qs.modules.ii.background.widgets

AbstractBackgroundWidget {
    id: root
    configEntryName: "media"

    implicitWidth: 380
    implicitHeight: 140

    readonly property var track: MprisController.activeTrack
    readonly property bool playing: MprisController.isPlaying
    readonly property bool hasPlayer: MprisController.activePlayer !== null

    StyledDropShadow {
        target: frame
    }

    Rectangle {
        id: frame
        anchors.fill: parent
        radius: Appearance.rounding.large
        color: Appearance.colors.colLayer0
        border.width: 1
        border.color: Appearance.colors.colLayer0Border

        RowLayout {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 14

            // capa
            Item {
                Layout.preferredWidth: 112
                Layout.preferredHeight: 112
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: 112
                        height: 112
                        radius: Appearance.rounding.normal
                    }
                }

                Rectangle {
                    anchors.fill: parent
                    color: Appearance.colors.colLayer1

                    MaterialSymbol {
                        anchors.centerIn: parent
                        text: "music_note"
                        iconSize: 40
                        color: Appearance.colors.colSubtext
                        visible: albumArt.status !== Image.Ready
                    }
                }

                Image {
                    id: albumArt
                    anchors.fill: parent
                    source: root.track?.artUrl ?? ""
                    fillMode: Image.PreserveAspectCrop
                    asynchronous: true
                    sourceSize.width: 224
                    sourceSize.height: 224

                    Behavior on opacity {
                        NumberAnimation { duration: 300 }
                    }
                }
            }

            // texto e controles
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 2

                Item { Layout.fillHeight: true }

                StyledText {
                    Layout.fillWidth: true
                    text: root.hasPlayer ? (root.track?.title ?? "") : "Nada tocando"
                    color: Appearance.colors.colOnLayer0
                    elide: Text.ElideRight
                    font {
                        pixelSize: 16
                        weight: Font.Medium
                    }
                }

                StyledText {
                    Layout.fillWidth: true
                    text: root.hasPlayer ? (root.track?.artist ?? "") : ""
                    color: Appearance.colors.colSubtext
                    elide: Text.ElideRight
                    font.pixelSize: 13
                }

                Item { Layout.fillHeight: true }

                RowLayout {
                    spacing: 4

                    MaterialSymbol {
                        text: "skip_previous"
                        iconSize: 26
                        color: MprisController.canGoPrevious
                            ? Appearance.colors.colOnLayer0
                            : Appearance.colors.colSubtext
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: MprisController.previous()
                        }
                    }

                    MaterialSymbol {
                        text: root.playing ? "pause_circle" : "play_circle"
                        fill: 1
                        iconSize: 34
                        color: Appearance.colors.colPrimary
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: MprisController.togglePlaying()
                        }
                    }

                    MaterialSymbol {
                        text: "skip_next"
                        iconSize: 26
                        color: MprisController.canGoNext
                            ? Appearance.colors.colOnLayer0
                            : Appearance.colors.colSubtext
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: MprisController.next()
                        }
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }
    }
}
