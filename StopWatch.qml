import QtQuick 2.13
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.13

ColumnLayout
{
   id : stopwatch
   spacing: 0

   // ----------------------------------------------------------------
   property bool stop_watch_start: false
   property double startTime: 0

   // ----------------------------------------------------------------
   // for update screen
   function timeChanged()
   {
      var today = new Date;
      stop_watch_text.text = Qt.formatTime(today, "HH:mm:ss AP")
   }

   Timer
   {
      id: stopwatchTimer
      interval: 10
      repeat: true
      running: true
      triggeredOnStart: true
      onTriggered: stopwatch.timeChanged()
   }

   // ----------------------------------------------------------------
   Rectangle
   {
      color: "black"

      Layout.preferredHeight: (parent.height * 0.2)
      Layout.preferredWidth: parent.width

      Text
      {
         id: stop_watch_text
         color: "yellow"

         text: qsTr("00 : 00 : 00")

         font.bold: true;
         font.pixelSize: 36
         style: Text.Raised;
         styleColor: "black"

         anchors.verticalCenter: parent.verticalCenter
         anchors.horizontalCenter: parent.horizontalCenter
      }
   }

   Rectangle
   {
      color: "black"

      Layout.preferredHeight: (parent.height * 0.6)
      Layout.preferredWidth: parent.width
   }

   RowLayout
   {
      ColumnLayout
      {
         Layout.preferredHeight: parent.height
         Layout.preferredWidth: (parent.width * 0.33)

         Button
         {
            text: "Start"
            id: button_start

            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            background: Rectangle
            {
               implicitWidth: 100
               implicitHeight: 40
               color: button_start.down ? "#404040" : "#808080"
               border.color: "#26282a"
               border.width: 1
               radius: 4
            }

            onClicked:
            {
               if (stop_watch_start == true)
               {
                  color: button_start.down ? "#606060" : "#808080"
                  button_start.text = "stop"
                  stop_watch_start = false
               }
               else
               {
                  color: button_start.down ? "#404040" : "#808080"
                  button_start.text = "start"
                  stop_watch_start = true
               }
            }

         }
      }

      ColumnLayout
      {
         Layout.preferredHeight: parent.height
         Layout.preferredWidth: (parent.width * 0.33)

         Button
         {
            text: "Record"
            id: button_record

            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            background: Rectangle
            {
               implicitWidth: 100
               implicitHeight: 40
               color: button_record.down ? "#404040" : "#808080"
               border.color: "#26282a"
               border.width: 1
               radius: 4
            }
         }
      }

      ColumnLayout
      {
         Layout.preferredHeight: parent.height
         Layout.preferredWidth: (parent.width * 0.33)

         Button
         {
            text: "Reset"
            id: button_reset

            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            background: Rectangle
            {
               implicitWidth: 100
               implicitHeight: 40
               color: button_reset.down ? "#404040" : "#808080"
               border.color: "#26282a"
               border.width: 1
               radius: 4
            }
         }
      }

      Layout.preferredHeight: (parent.height * 0.2)
      Layout.preferredWidth: parent.width
   }
}

