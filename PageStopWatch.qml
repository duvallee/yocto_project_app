import QtQuick 2.13
import QtQuick.Controls 2.13

Page
{
   id: page_stopwatch

   StopWatch
   {
      anchors.left: parent.left;
      anchors.top: parent.top;
      anchors.right: parent.right;
      anchors.bottom: parent.bottom;
   }
}

