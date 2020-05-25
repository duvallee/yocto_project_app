// ****************************************************************
//
// File: main.cpp
//
// Written by duvallee in 2020
//
// ****************************************************************
#include <QtQml>

#include <QMouseEvent>

#include <QApplication>
#include <QScopedPointer>


#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQuickView>



QCoreApplication* createApplication(int &argc, char *argv[])
{
   return new QApplication(argc, argv);
}


// --------------------------------------------------------------------------
//  Name : main()
//         
// 
// --------------------------------------------------------------------------
int main(int argc, char *argv[])
{
   QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

   QScopedPointer<QCoreApplication> app((QCoreApplication *) (new QApplication(argc, argv)));

//   qmlRegisterType<DigitalClock>("digitalclocks", 1, 0, "DigitalClock");

//   DigitalClock clock;
//   clock.show();

   if (qobject_cast<QApplication *>(app.data()))
   {
   }


   QQmlApplicationEngine engine(QUrl("qrc:/main.qml"));;
   if (engine.rootObjects().isEmpty())
   {
      return -1;
   }

   return app->exec();
}

#if 0

// --------------------------------------------------------------------------
//  Name : main()
//         
// 
// --------------------------------------------------------------------------
int main(int argc, char *argv[])
{
#if 1
   QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

   QGuiApplication app(argc, argv);

   qmlRegisterType<DigitalClock>("digitalclocks", 1, 0, "DigitalClock");

#if 0
   QQmlApplicationEngine engine(QUrl("qrc:/main.qml"));;
   if (engine.rootObjects().isEmpty())
   {
      return -1;
   }
#else
   QQuickView view;
//   view.engine()->addImportPath("qrc:/qml/imports");
   view.setSource(QUrl("qrc:/main.qml"));
   if (!view.errors().isEmpty())
      return -1;
   view.show();
#endif

   return app.exec();


#if 0
   QQmlApplicationEngine engine;
   engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
#endif


#else
   QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

   QGuiApplication app(argc, argv);

   QQmlApplicationEngine engine;
   const QUrl url(QStringLiteral("qrc:/main.qml"));

//   qmlRegisterType<DigitalClock>("digitalclocks", 1, 0, "DigitalClock");

   QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl)
   {
      if (!obj && url == objUrl)
      {
         QCoreApplication::exit(-1);
      }
   }, Qt::QueuedConnection);

   engine.load(url);
//   engine.load(QUrl(QStringLiteral("qrc:/Page3Form.qml")));


   return app.exec();
#endif
}
#endif


