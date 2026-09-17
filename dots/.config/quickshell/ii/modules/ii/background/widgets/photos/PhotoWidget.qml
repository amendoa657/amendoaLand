import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell.Io
import qs
import qs.modules.common
import qs.modules.common.widgets
import qs.modules.ii.background.widgets

AbstractBackgroundWidget {
    id: root
    configEntryName: "photos"

    implicitWidth: 320
    implicitHeight: 240

    readonly property string folder: "/run/user/1000/fe08adfa88664ff488cafe2d338d96fd/storage/emulated/0/Pictures/Gallery/owner/fotosLegais"
    property var photos: []
    property int currentIndex: 0

    Process {
        id: listProc
        running: true
        command: ["bash", "-c",
            `find "${root.folder}" -maxdepth 1 -type f \\( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \\) -printf '%T@ %p\\n' 2>/dev/null | sort -rn | head -20 | cut -d' ' -f2-`]
        stdout: StdioCollector {
            id: collector
            onStreamFinished: {
                const lines = collector.text.trim().split("\n").filter(l => l.length > 0);
                root.photos = lines;
                root.currentIndex = 0;
                if (lines.length > 0)
                    photoContainer.swapTo(lines[0]);
            }
        }
    }

    Timer {
        interval: 70000
        running: root.photos.length > 1
        repeat: true
        onTriggered: {
            let next = root.currentIndex;
            while (next === root.currentIndex) {
                next = Math.floor(Math.random() * root.photos.length);
            }
            root.currentIndex = next;
            photoContainer.swapTo(root.photos[next]);
        }
    }

    Timer {
        interval: 300000
        running: true
        repeat: true
        onTriggered: {
            listProc.running = false;
            listProc.running = true;
        }
    }

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

        Item {
            id: photoContainer
            anchors.fill: parent
            anchors.margins: 6
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: photoContainer.width
                    height: photoContainer.height
                    radius: Appearance.rounding.large - 4
                }
            }

            property bool showA: true

            component Slide: Image {
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                cache: false
                sourceSize.width: 720
                sourceSize.height: 540
                transformOrigin: Item.Center

                Behavior on opacity {
                    NumberAnimation {
                        duration: 1100
                        easing.type: Easing.InOutCubic
                    }
                }
                Behavior on scale {
                    NumberAnimation {
                        duration: 1100
                        easing.type: Easing.OutCubic
                    }
                }
            }

            Slide {
                id: slideA
                opacity: photoContainer.showA ? 1 : 0
                scale: photoContainer.showA ? 1.0 : 1.06
            }

            Slide {
                id: slideB
                opacity: photoContainer.showA ? 0 : 1
                scale: photoContainer.showA ? 1.06 : 1.0
            }

            function swapTo(path) {
                if (showA) {
                    slideB.scale = 1.12;
                    slideB.source = "file://" + path;
                } else {
                    slideA.scale = 1.12;
                    slideA.source = "file://" + path;
                }
                showA = !showA;
            }
        }

        StyledText {
            anchors.centerIn: parent
            visible: root.photos.length === 0
            text: "Celular desconectado"
            color: Appearance.colors.colSubtext
            font.pixelSize: 13
        }
    }
}
