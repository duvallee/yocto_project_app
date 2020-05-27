
import QtQuick 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.11


import duvallee.custom.StopWatchControl 1.0

ColumnLayout
{
   id : stopwatch
   spacing: 0

   // ----------------------------------------------------------------
   // for update screen
   function timeChanged()
   {
      stop_watch_text.text = stopwatchcontrol.getStopWatchTimerValue
   }

   Timer
   {
      id: stopwatchTimer
      interval: 20
      repeat: true
      running: true
      triggeredOnStart: true
      onTriggered: stopwatch.timeChanged()
   }

   // ----------------------------------------------------------------
   StopWatchControl
   {
      id: stopwatchcontrol
   }

   // ----------------------------------------------------------------
   Rectangle
   {
      color: main_window.color

      Layout.preferredHeight: (parent.height * 0.2)
      Layout.preferredWidth: parent.width

      Text
      {
         id: stop_watch_text
         color: "yellow"

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
      color: main_window.color

      Layout.preferredHeight: (parent.height * 0.6)
      Layout.preferredWidth: parent.width

      ListView
      {
         id: stopwatch_history
         model: input_stopwatch_history

         delegate: Text
         {
            width: stopwatch_history.width

            anchors.horizontalCenter: parent.horizontalCenter

            color: "#A0A0A0"

            font.pixelSize: 16
            style: Text.Raised;
            styleColor: "black"

            text: history
         }

         verticalLayoutDirection: ListView.BottomToTop
         width: parent.width
         height: parent.height
      }

      ListModel
      {
         id: input_stopwatch_history
      }

//      Component
//      {
//      }
   }

   RowLayout
   {
      id: button_row_layout

      Layout.preferredHeight: (parent.height * 0.2)
      Layout.preferredWidth: parent.width

      spacing: 0

      ColumnLayout
      {
         Layout.preferredHeight: parent.height
         Layout.preferredWidth: (parent.width * 0.33)

         spacing: 0

         Button
         {
            id: button_start
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            contentItem: Text
            {
               text: stopwatchcontrol.getStopWatchRunnig == 1 ? "stop" : "start"
               font: button_record.font
               // color:
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle
            {
               implicitWidth: 100
               implicitHeight: 40

               color: stopwatchcontrol.getStopWatchRunnig == 1 ? (button_start.down ? "#404040" : "#808080") : (button_start.down ? "#404040" : "#808080")

               border.color: "#26282a"
               border.width: 1
               radius: 4
            }

            onClicked:
            {
               if (stopwatchcontrol.getStopWatchRunnig == 1)
               {
                  button_record.enabled = false;
                  button_record.visible = false;

                  button_reset.enabled = true;
                  button_reset.visible = true;
                  stopwatchcontrol.StopStopWatch
               }
               else
               {
                  button_record.enabled = true;
                  button_record.visible = true;

                  if (stopwatchcontrol.getStopWatchReset)
                  {
                     button_reset.enabled = true;
                     button_reset.visible = true;
                  }
                  else
                  {
                     button_reset.enabled = false;
                     button_reset.visible = false;
                  }
                  stopwatchcontrol.StartStopWatch
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
            enabled: false;
            visible: false;

            background: Rectangle
            {
               implicitWidth: 100
               implicitHeight: 40
               color: button_record.down ? "#404040" : "#808080"
               border.color: "#26282a"
               border.width: 1
               radius: 4
            }

            onClicked:
            {
               input_stopwatch_history.append({history: stopwatchcontrol.getStopWatchTimerRecording});
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

            enabled: false;
            visible: false;

            background: Rectangle
            {
               implicitWidth: 100
               implicitHeight: 40
               color: button_reset.down ? "#404040" : "#808080"
               border.color: "#26282a"
               border.width: 1
               radius: 4
            }

            onClicked:
            {
               button_reset.enabled = false;
               button_reset.visible = false;

               button_record.enabled = false;
               button_record.visible = false;

               stopwatchcontrol.ReStartStopWatch

               input_stopwatch_history.clear()
            }
         }
      }
   }
}

