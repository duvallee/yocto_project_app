import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

ApplicationWindow
{
   id: main_window
   visible: true
   width: 640
   height: 480
   title: qsTr("qt-swipe-view")

   SwipeView
   {
      id: swipeView
      currentIndex: 0

      anchors.fill: parent

      Page
      {
         Rectangle
         {
            id : clock
            antialiasing: true
            color : "black"

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Text
            {
               color: "green"

               text: "Quest 6 - duvallee"

               font.bold: true;
               font.pixelSize: 36
               style: Text.Raised;
               styleColor: "black"

               anchors.verticalCenter: parent.verticalCenter
               anchors.horizontalCenter: parent.horizontalCenter
            }
         }
      }

      PageDigitalClock
      {
         id: pagedigitalclock
      }

      PageStopWatch
      {
         id: pagestopwatch
      }
   }

   PageIndicator
   {
      id: pageindicator

      count: swipeView.count
      currentIndex: swipeView.currentIndex

      anchors.bottom: swipeView.bottom
      anchors.horizontalCenter: parent.horizontalCenter
   }

}

