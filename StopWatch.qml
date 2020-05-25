import QtQuick 2.13
import QtQuick.Layouts 1.1

Rectangle
{
   id : stopwatch

   antialiasing: true
   color : "black"


   Rectangle
   {
      color: "red"

      height: (parent.height * 0.2)
      width: parent.width
   }

   Rectangle
   {
      color: "green"

      height: (parent.height * 0.6)
      width: parent.width
   }

   Rectangle
   {
      color: "blue"

      height: (parent.height * 0.2)
      width: parent.width
   }

}

