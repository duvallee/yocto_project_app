// ****************************************************************
//
// File: StopWatchControl.cpp
//
// Written by duvallee in 2020
//
// ****************************************************************

#include "StopWatchControl.h"

// --------------------------------------------------------------------------
//  Name : StopWatchControl()
//         
// 
// --------------------------------------------------------------------------
StopWatchControl::StopWatchControl(QObject *parent) : QObject(parent)
{
}

// --------------------------------------------------------------------------
//  Name : userName()
//         
// 
// --------------------------------------------------------------------------
QString StopWatchControl::userName()
{
   return m_userName;
}

// --------------------------------------------------------------------------
//  Name : setUserName()
//         
// 
// --------------------------------------------------------------------------
void StopWatchControl::setUserName(const QString &userName)
{
   if (userName == m_userName)
   {
      return;
   }

   m_userName = userName;
   emit userNameChanged();
}



