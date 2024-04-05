import QtQuick

Window {
    width: aircraftSeat.width + 50
    height: aircraftSeat.height + 50
    visible: true
    title: qsTr("Aircraft Seat Control")

    AircraftSeat {
        id: aircraftSeat

        anchors.centerIn: parent
    }
}
