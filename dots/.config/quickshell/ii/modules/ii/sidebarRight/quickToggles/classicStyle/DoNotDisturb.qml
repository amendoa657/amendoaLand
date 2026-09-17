import qs.modules.common.widgets
import qs.services

QuickToggleButton {
    id: root
    toggled: Notifications.silent
    buttonIcon: Notifications.silent ? "notifications_paused" : "notifications_active"
    onClicked: {
        Notifications.silent = !Notifications.silent
    }
    StyledToolTip {
        text: Translation.tr("Do not disturb")
    }
}
