import QtQuick
import QtQuick.Controls 2.15
import Qt.labs.settings

Item {
    id: root

    width: column.width
    height: column.height

    enum ASControlType {
        FOOTREST = 1,
        BACKREST = 2,
        HEADREST = 3,
        CUSHION = 4
    }

    function toStr(ct) {
        switch(ct) {
        case AircraftSeat.ASControlType.FOOTREST:
            return qsTr("Foot Rest");
        case AircraftSeat.ASControlType.BACKREST:
            return qsTr("Back Rest");
        case AircraftSeat.ASControlType.HEADREST:
            return qsTr("HEAD Rest");
        case AircraftSeat.ASControlType.CUSHION:
            return qsTr("Cushion Firmness");
        default:
            return qsTr("No Name");
        }
    }

    component ASSlider: Row {
        id: asSlider

        required property int controlType
        property alias minValue: slider.from
        property alias maxValue: slider.to
        property alias value: slider.value

        spacing: 20

        Label {
            id: sliderName

            width: 120
            text: toStr(asSlider.controlType)
        }

        Slider {
            id: slider

            width: 150
            from: 0
            to: 1
            value: 0
            stepSize: 1

            onValueChanged: {
                // Send the value to the interface to set the correct value for the specified item, considering its control type.
                console.log(toStr(asSlider.controlType), "  ", value)
            }
        }

        Label {
            width: 30
            text: slider.value
        }
    }

    Settings {
        id: appSettings

        property alias footrestPosition: footrest.value
        property alias backrestPosition: backrest.value
        property alias headrestPosition: headrest.value
        property alias cushionFirmness: cushion.value

        fileName: "config.ini"
    }

    Column {
        id: column

        spacing: 50

        ASSlider {
            id: footrest

            controlType: AircraftSeat.ASControlType.FOOTREST
            minValue: 30
            maxValue: 60
        }

        ASSlider {
            id: backrest

            controlType: AircraftSeat.ASControlType.BACKREST
            minValue: 90
            maxValue: 180
        }

        ASSlider {
            id: headrest

            controlType: AircraftSeat.ASControlType.HEADREST
            minValue: 45
            maxValue: 125
        }

        ASSlider {
            id: cushion

            controlType: AircraftSeat.ASControlType.CUSHION
            minValue: 1
            maxValue: 10
        }
    }
}
