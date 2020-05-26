// ****************************************************************
//
// File: StopWatchControl.h
//
// Written by duvallee in 2020
//
// ****************************************************************


#ifndef STOPWATCHCONTROL_H_
#define STOPWATCHCONTROL_H_

#include <QObject>
#include <QString>

class StopWatchControl : public QObject
{
   Q_OBJECT
   Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)

public:
   explicit StopWatchControl(QObject* parent = nullptr);

   QString userName();
   void setUserName(const QString &userName);

signals:
   void userNameChanged();

private:
   QString m_userName;

};

#endif   // STOPWATCHCONTROL_H_


