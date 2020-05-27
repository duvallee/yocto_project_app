// ****************************************************************
//
// File: main.cpp
//
// Written by duvallee in 2020
//
// ****************************************************************
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "StopWatchControl.h"

// --------------------------------------------------------------------------
//  Name : main()
//         
// 
// --------------------------------------------------------------------------
int main(int argc, char *argv[])
{
   QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
   QGuiApplication app(argc, argv);

   // --------------------------------------------------------------------------
   qmlRegisterType<StopWatchControl>("duvallee.custom.StopWatchControl", 1, 0, "StopWatchControl");

   // --------------------------------------------------------------------------
   QQmlApplicationEngine engine(QUrl("qrc:/main.qml"));;
   if (engine.rootObjects().isEmpty())
   {
      return -1;
   }

   return app.exec();
}


